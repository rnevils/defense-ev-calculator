import calcs.{type Nature, type NatureOption, type PkmnConfig, type Results}
import gleam/dict.{type Dict}
import gleam/dynamic.{type Dynamic}
import gleam/dynamic/decode
import gleam/float
import gleam/int
import gleam/json
import gleam/list
import gleam/pair
import gleam/result
import gleam/string
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import pokedex.{type Pokemon}

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

type Model {
  Model(
    config: PkmnConfig,
    results: Results,
    data: Dict(String, Pokemon),
    light_theme: Bool,
  )
}

fn init(_args) -> #(Model, Effect(Msg)) {
  let data = dict.from_list(pokedex.pokedex)

  // default to abra
  let initial_pokemon_name = "Abra"
  let assert Ok(pokemon) = dict.get(data, initial_pokemon_name)

  let config = set_config(pokemon)
  let results = calcs.calc_results(config)

  #(Model(config:, results:, data:, light_theme: False), get_theme())
}

type ConfigUpdate {
  UserUpdatedPokemon(String)
  UserUpdatedHPIVs(String)
  UserUpdatedDefIVs(String)
  UserUpdatedSDefIVs(String)
  UserUpdatedEVsLeft(String)
  UserUpdatedNature(String)
  UserUpdatedBias(String)
  UserUpdatedLevel(String)
  UserResetBias
}

type Msg {
  LocalStorageReturnedTheme(Result(Bool, Nil))
  UserToggledTheme(Bool)
  ConfigMsg(config_msg: ConfigUpdate)
}

fn valid_evs_left_range(evs_left: Int) {
  case evs_left > -1 && evs_left < 509 {
    True -> Ok(evs_left)
    False -> Error(Nil)
  }
}

fn valid_level_range(level: Int) {
  case level > -1 && level < 101 {
    True -> Ok(level)
    False -> Error(Nil)
  }
}

fn valid_ivs_range(ivs: Int) {
  case ivs > -1 && ivs < 32 {
    True -> Ok(ivs)
    False -> Error(Nil)
  }
}

fn parse_input_int(s: String) {
  case s {
    "" -> Ok(0)
    _ -> int.parse(s)
  }
}

fn validate_input(model: Model, msg: ConfigUpdate) {
  case msg {
    UserUpdatedPokemon(pokemon_name) -> {
      model.data
      |> dict.get(pokemon_name)
      |> result.try(fn(x) { Ok(set_config(x)) })
    }
    UserUpdatedEVsLeft(evs_left_string) -> {
      evs_left_string
      |> parse_input_int
      |> result.try(valid_evs_left_range)
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, evs_left: x)) })
    }
    UserUpdatedBias(bias_string) -> {
      bias_string
      |> parse_input_int
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, bias: x)) })
    }
    UserUpdatedNature(nature_string) -> {
      nature_string
      |> string_to_nature_option
      |> result.try(fn(x) {
        Ok(calcs.PkmnConfig(..model.config, nature_option: x))
      })
    }
    UserUpdatedLevel(level_string) -> {
      level_string
      |> parse_input_int
      |> result.try(valid_level_range)
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, level: x)) })
    }
    UserUpdatedHPIVs(hp_iv_string) -> {
      hp_iv_string
      |> parse_input_int
      |> result.try(valid_ivs_range)
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, hp_iv: x)) })
    }
    UserUpdatedDefIVs(def_iv_string) -> {
      def_iv_string
      |> parse_input_int
      |> result.try(valid_ivs_range)
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, def_iv: x)) })
    }
    UserUpdatedSDefIVs(sdef_iv_string) -> {
      sdef_iv_string
      |> parse_input_int
      |> result.try(valid_ivs_range)
      |> result.try(fn(x) { Ok(calcs.PkmnConfig(..model.config, sdef_iv: x)) })
    }
    UserResetBias -> {
      Ok(calcs.PkmnConfig(..model.config, bias: 50))
    }
  }
}

fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    LocalStorageReturnedTheme(Error(_)) -> #(model, effect.none())
    LocalStorageReturnedTheme(Ok(light_theme)) -> {
      #(Model(..model, light_theme:), effect.none())
    }
    UserToggledTheme(toggle) -> {
      case toggle {
        True -> #(Model(..model, light_theme: True), set_light_theme(True))
        False -> #(Model(..model, light_theme: False), set_light_theme(False))
      }
    }
    ConfigMsg(config_update) -> update_config(model, config_update)
  }
}

fn update_config(
  model: Model,
  config_msg: ConfigUpdate,
) -> #(Model, Effect(Msg)) {
  case validate_input(model, config_msg) {
    Ok(config) -> {
      let results = calcs.calc_results(config)
      #(Model(..model, config:, results:), effect.none())
    }
    Error(_) -> #(model, effect.none())
  }
}

fn get_theme() -> Effect(Msg) {
  use dispatch <- effect.from
  let result =
    result.try(get_localstorage("light_theme"), fn(dyn) {
      case decode.run(dyn, decode.bool) {
        Ok(theme) -> Ok(theme)
        Error(_) -> Error(Nil)
      }
    })

  dispatch(LocalStorageReturnedTheme(result))
}

@external(javascript, "./app.ffi.mjs", "get_localstorage")
fn get_localstorage(_key: String) -> Result(Dynamic, Nil) {
  Error(Nil)
}

fn set_light_theme(light_theme: Bool) -> Effect(msg) {
  use _ <- effect.from
  let json = json.bool(light_theme)

  set_localstorage("light_theme", json.to_string(json))
}

@external(javascript, "./app.ffi.mjs", "set_localstorage")
fn set_localstorage(_key: String, _value: String) -> Nil {
  Nil
}

fn set_config(pokemon: Pokemon) {
  calcs.PkmnConfig(
    pokemon_name: pokemon.name,
    base_hp: pokemon.stats.hp,
    base_def: pokemon.stats.def,
    base_sdef: pokemon.stats.sdef,
    hp_iv: 31,
    def_iv: 31,
    sdef_iv: 31,
    evs_left: 508,
    level: 100,
    nature_option: calcs.NeutralOption,
    bias: 50,
  )
}

fn render_pokemon_names(pokemon_name: String) {
  pokedex.pokedex
  |> list.map(pair.first)
  |> list.sort(string.compare)
  |> list.map(fn(pkmn) {
    case pokemon_name == pkmn {
      True ->
        html.option([attribute.value(pkmn), attribute.selected(True)], pkmn)
      False -> html.option([attribute.value(pkmn)], pkmn)
    }
  })
}

fn render_nature(selected_nature: NatureOption) {
  list.map(
    [
      calcs.FindBestOption,
      calcs.NeutralOption,
      calcs.IncreaseDefOption,
      calcs.IncreaseSDefOption,
    ],
    fn(nature) {
      let nature_string = nature_option_to_string(nature)
      case nature == selected_nature {
        True ->
          html.option(
            [attribute.value(nature_string), attribute.selected(True)],
            nature_string,
          )
        False -> html.option([attribute.value(nature_string)], nature_string)
      }
    },
  )
}

fn nature_option_to_string(nature: NatureOption) {
  case nature {
    calcs.FindBestOption -> "Find Best"
    calcs.NeutralOption -> "Neutral"
    calcs.IncreaseDefOption -> "IncreaseDef"
    calcs.IncreaseSDefOption -> "IncreaseSDef"
    calcs.DecreaseDefOption -> "DecreaseDef"
    calcs.DecreaseSDefOption -> "DecreaseSDef"
  }
}

fn string_to_nature_option(s: String) {
  case s {
    "Find Best" -> Ok(calcs.FindBestOption)
    "IncreaseDef" -> Ok(calcs.IncreaseDefOption)
    "IncreaseSDef" -> Ok(calcs.IncreaseSDefOption)
    "DecreaseDef" -> Ok(calcs.DecreaseDefOption)
    "DecreaseSDef" -> Ok(calcs.DecreaseSDefOption)
    "Neutral" -> Ok(calcs.NeutralOption)
    _ -> Error(Nil)
  }
}

fn nature_to_string(nature: Nature) {
  case nature {
    calcs.IncreaseDef -> "IncreaseDef"
    calcs.IncreaseSDef -> "IncreaseSDef"
    calcs.Neutral -> "Neutral"
    _ -> "How did that happen?!"
  }
}

fn td_input(stat) {
  html.td([attribute.class("border-none")], [
    html.input([
      attribute.class("input input-sm"),
      attribute.class("input w-[50px]"),
      attribute.disabled(True),
      attribute.value(int.to_string(stat)),
    ]),
  ])
}

fn td_input_editable(stat, min, max, update_msg) {
  html.td([attribute.class("border-none w-1/4")], [
    html.input([
      attribute.class("input input-sm"),
      attribute.class("input w-[50px]"),
      event.on_input(update_msg),
      attribute.maxlength(3),
      attribute.min(min),
      attribute.max(max),
      attribute.required(True),
      attribute.value(int.to_string(stat)),
    ]),
  ])
}

fn td_text(text: String) {
  html.td([attribute.class("border-none"), attribute.class("w-1/4")], [
    html.text(text),
  ])
}

fn view(model: Model) -> Element(Msg) {
  html.div(
    [attribute.class("font-mono p-4 w-full max-w-5xl mx-auto space-y-8")],
    [
      html.div(
        [
          attribute.id("navbar"),
          attribute.class("navbar"),
        ],
        [
          html.div([attribute.class("flex-1 text-4xl")], [
            html.text("Defense EV Calculator"),
          ]),
          html.div([attribute.class("flex-none")], [
            html.ul([attribute.class("menu menu-horizontal px-1")], [
              html.li([], [
                html.a(
                  [
                    attribute.target("_blank"),
                    attribute.href(
                      "https://github.com/rnevils/defense-ev-calculator",
                    ),
                  ],
                  [
                    html.img([
                      attribute.height(28),
                      attribute.width(28),
                      attribute.alt("GitHub"),
                      case model.light_theme {
                        True -> attribute.src("GitHub.svg")
                        False -> attribute.src("GitHub_white.svg")
                      },
                    ]),
                  ],
                ),
              ]),
              html.li([attribute.class("justify-center")], [
                html.input([
                  event.on_check(UserToggledTheme),
                  attribute.class("toggle theme-controller al"),
                  attribute.checked(model.light_theme),
                  attribute.value("light"),
                  attribute.type_("checkbox"),
                ]),
              ]),
            ]),
          ]),
        ],
      ),
      html.div(
        [
          attribute.class("grid grid-cols-1 md:grid-cols-2 gap-y-8 gap-x-20"),
        ],
        [
          html.div(
            [
              attribute.id("config"),
              attribute.class("bg-base-300 rounded-box shadow-md p-4"),
            ],
            [
              html.div(
                [
                  attribute.class("overflow-x-auto "),
                ],
                [
                  html.table([attribute.class("table table-sm")], [
                    html.tbody([], [
                      html.tr([], [
                        html.td(
                          [attribute.class("border-none"), attribute.colspan(2)],
                          [
                            html.select(
                              [
                                attribute.class(
                                  "select select-sm max-w-[167px]",
                                ),
                                event.on_change(fn(s) {
                                  ConfigMsg(config_msg: UserUpdatedPokemon(s))
                                }),
                              ],
                              render_pokemon_names(model.config.pokemon_name),
                            ),
                          ],
                        ),
                      ]),
                      html.tr([], [
                        td_text("Base HP:"),
                        td_input(model.config.base_hp),
                        td_text("IVs HP:"),
                        td_input_editable(model.config.hp_iv, "0", "31", fn(s) {
                          ConfigMsg(config_msg: UserUpdatedHPIVs(s))
                        }),
                      ]),
                      html.tr([], [
                        td_text("Base Def:"),
                        td_input(model.config.base_def),
                        td_text("IVs Def:"),
                        td_input_editable(model.config.def_iv, "0", "31", fn(s) {
                          ConfigMsg(config_msg: UserUpdatedDefIVs(s))
                        }),
                      ]),
                      html.tr([], [
                        td_text("Base SDef:"),
                        td_input(model.config.base_sdef),
                        td_text("IVs SDef:"),
                        td_input_editable(
                          model.config.sdef_iv,
                          "0",
                          "31",
                          fn(s) { ConfigMsg(config_msg: UserUpdatedSDefIVs(s)) },
                        ),
                      ]),
                      html.tr([], [
                        td_text("EVs left:"),
                        td_input_editable(
                          model.config.evs_left,
                          "0",
                          "508",
                          fn(s) { ConfigMsg(config_msg: UserUpdatedEVsLeft(s)) },
                        ),
                        td_text("Level:"),
                        td_input_editable(model.config.level, "0", "100", fn(s) {
                          ConfigMsg(config_msg: UserUpdatedLevel(s))
                        }),
                      ]),
                      html.tr([], [
                        td_text("Nature:"),
                        html.td(
                          [
                            attribute.class("border-none"),
                            attribute.colspan(3),
                          ],
                          [
                            html.select(
                              [
                                attribute.class(
                                  "select select-sm max-w-[130px]",
                                ),
                                event.on_change(fn(s) {
                                  ConfigMsg(config_msg: UserUpdatedNature(s))
                                }),
                              ],
                              render_nature(model.config.nature_option),
                            ),
                          ],
                        ),
                      ]),

                      html.tr([attribute.class("")], [
                        html.td([attribute.class("text-right border-none")], [
                          html.text("SDef"),
                        ]),
                        html.td(
                          [
                            attribute.class("text-center border-none"),
                            attribute.colspan(2),
                          ],
                          [
                            html.text("Bias"),
                          ],
                        ),
                        html.td([attribute.class("text-left border-none")], [
                          html.text("Def"),
                        ]),
                      ]),
                      html.tr([attribute.class("")], [
                        html.td(
                          [
                            attribute.class("text-right border-none"),
                          ],
                          [
                            html.input([
                              attribute.class(
                                "input w-[60px] input-sm text-center",
                              ),

                              attribute.disabled(True),
                              attribute.value(
                                int.to_string(100 - model.config.bias) <> "%",
                              ),
                            ]),
                          ],
                        ),
                        html.td(
                          [
                            attribute.class("text-center border-none"),
                            attribute.colspan(2),
                          ],
                          [
                            html.input([
                              attribute.class(
                                "range range-primary-content range-xs",
                              ),
                              event.on_input(fn(s) {
                                ConfigMsg(config_msg: UserUpdatedBias(s))
                              }),
                              attribute.value(int.to_string(model.config.bias)),
                              attribute.min("0"),
                              attribute.max("100"),
                              attribute.step("1"),
                              attribute.name("bias"),
                              attribute.id("bias"),
                              attribute.type_("range"),
                            ]),
                          ],
                        ),

                        html.td([attribute.class("text-left border-none")], [
                          html.input([
                            attribute.class(
                              "input w-[60px] input-sm text-center",
                            ),
                            attribute.disabled(True),
                            attribute.value(
                              int.to_string(model.config.bias) <> "%",
                            ),
                          ]),
                        ]),
                      ]),
                      html.tr([], [
                        html.td([attribute.colspan(3)], []),
                        html.td([], [
                          html.button(
                            [
                              attribute.class("btn btn-soft btn-primary btn-sm"),
                              event.on_click(ConfigMsg(UserResetBias)),
                            ],
                            [html.text("reset")],
                          ),
                        ]),
                      ]),
                    ]),
                  ]),
                ],
              ),
            ],
          ),
          html.div(
            [
              attribute.id("results"),
              attribute.class("bg-base-200 rounded-box shadow-md p-4"),
            ],
            [
              html.div([attribute.class("overflow-x-auto ")], [
                html.table([attribute.class("table")], [
                  html.thead([], [
                    html.tr([], [
                      html.th([], []),
                      html.th([], [html.text("EVs")]),
                      html.th([], [html.text("Stat")]),
                      html.th([], [html.text("Tier")]),
                    ]),
                  ]),
                  html.tbody([], [
                    html.tr([], [
                      td_text("HP:"),
                      td_text(int.to_string(model.results.hp_evs)),
                      td_text(int.to_string(model.results.hp_stat)),
                      td_text("N/A"),
                    ]),
                    html.tr([], [
                      td_text("Def:"),
                      td_text(int.to_string(model.results.def_evs)),
                      td_text(int.to_string(model.results.def_stat)),
                      td_text(
                        float.to_string(float.to_precision(
                          model.results.def_tier,
                          2,
                        )),
                      ),
                    ]),
                    html.tr([], [
                      td_text("SDef:"),
                      td_text(int.to_string(model.results.sdef_evs)),
                      td_text(int.to_string(model.results.sdef_stat)),
                      td_text(
                        float.to_string(float.to_precision(
                          model.results.sdef_tier,
                          2,
                        )),
                      ),
                    ]),
                    html.tr([], [
                      td_text("Nature:"),
                      html.td(
                        [attribute.class("border-none"), attribute.colspan(3)],
                        [html.text(nature_to_string(model.results.nature))],
                      ),
                    ]),
                  ]),
                ]),
              ]),
            ],
          ),
        ],
      ),
      html.div([attribute.id("reference")], [
        html.text("Reference:"),
        html.ul([attribute.class("list-disc pl-6")], [
          html.li([], [
            html.a(
              [
                attribute.class("link link-primary"),
                attribute.href(
                  "https://www.smogon.com/dp/articles/maximizing_defenses",
                ),
              ],
              [
                html.text("How To Maximize Your Defenses"),
              ],
            ),
          ]),
          html.li([], [
            html.a(
              [
                attribute.class("link link-primary"),
                attribute.href(
                  "https://www.smogon.com/forums/threads/defense-and-special-defense-tiers.24931/",
                ),
              ],
              [
                html.text("Defensive tiers"),
              ],
            ),
          ]),
          html.li([], [
            html.a(
              [
                attribute.class("link link-primary"),
                attribute.href("https://pokestudio.altervista.org/defevs.php"),
              ],
              [
                html.text("PHP Defense EV Calculator"),
              ],
            ),
          ]),
        ]),
      ]),
    ],
  )
}
