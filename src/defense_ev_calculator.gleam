import calcs.{type Nature, type NatureOption, type PkmnConfig, type Results}
import gleam/dict.{type Dict}
import gleam/float
import gleam/int
import gleam/list
import gleam/result
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import pokedex.{type Pokemon}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

type Model {
  Model(config: PkmnConfig, results: Results, data: Dict(String, Pokemon))
}

fn init(_args) -> Model {
  let data = dict.from_list(pokedex.pokedex)

  // default to abra
  let initial_pokemon_name = "Abra"
  let assert Ok(pokemon) = dict.get(data, initial_pokemon_name)

  let config = set_config(pokemon)
  let results = calcs.calc_results(config)

  Model(config:, results:, data:)
}

type Msg {
  UserUpdatedPokemon(String)
  UserUpdatedHPIVs(String)
  UserUpdatedDefIVs(String)
  UserUpdatedSDefIVs(String)
  UserUpdatedEVsLeft(String)
  UserUpdatedNature(String)
  UserUpdatedBias(String)
  UserUpdatedLevel(String)
}

fn update(model: Model, msg: Msg) -> Model {
  let config = case msg {
    UserUpdatedPokemon(pokemon_name) -> {
      // get new pokemon
      let assert Ok(pokemon) = dict.get(model.data, pokemon_name)
      set_config(pokemon)
    }
    UserUpdatedEVsLeft(evs_left_string) -> {
      let assert Ok(evs_left) = int.parse(evs_left_string)
      calcs.PkmnConfig(..model.config, evs_left:)
    }
    UserUpdatedBias(bias_string) -> {
      // let bias = get_float(bias_string)
      let assert Ok(bias) = int.parse(bias_string)
      calcs.PkmnConfig(..model.config, bias:)
    }
    UserUpdatedNature(nature_string) -> {
      let nature = string_to_nature(nature_string)
      calcs.PkmnConfig(..model.config, nature:)
    }
    UserUpdatedLevel(level_string) -> {
      todo
    }
    UserUpdatedHPIVs(_) -> todo
    UserUpdatedDefIVs(_) -> todo
    UserUpdatedSDefIVs(_) -> todo
  }
  let results = calcs.calc_results(config)
  Model(..model, config:, results:)
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
    nature: calcs.NeutralOption,
    bias: 50,
  )
}

fn get_float(s: String) {
  case s {
    "1" -> 1.0
    "0" -> 0.0
    _ ->
      float.parse(s)
      |> result.unwrap(0.0)
  }
}

fn render_pokemon_names(pokemon_name: String) {
  list.map(pokedex.pokedex, fn(pkmn) {
    case pokemon_name == pkmn.0 {
      True ->
        html.option([attribute.value(pkmn.0), attribute.selected(True)], pkmn.0)
      False -> html.option([attribute.value(pkmn.0)], pkmn.0)
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

fn nature_to_string(nature: Nature) {
  case nature {
    calcs.IncreaseDef -> "IncreaseDef"
    calcs.IncreaseSDef -> "IncreaseSDef"
    calcs.Neutral -> "Neutral"
    _ -> "How did that happen?!"
  }
}

fn string_to_nature(s: String) {
  case s {
    "Find Best" -> calcs.FindBestOption
    "IncreaseDef" -> calcs.IncreaseDefOption
    "IncreaseSDef" -> calcs.IncreaseSDefOption
    _ -> calcs.NeutralOption
  }
}

fn redner_aa() {
  todo
}

fn td_input(stat) {
  html.td([attribute.class("border-none")], [
    html.input([
      attribute.class("input"),
      attribute.disabled(True),
      attribute.value(int.to_string(stat)),
    ]),
  ])
}

fn td_input_editable(stat, update_msg) {
  html.td([attribute.class("border-none")], [
    html.input([
      attribute.class("input"),
      event.on_input(update_msg),
      attribute.value(int.to_string(stat)),
    ]),
  ])
}

fn td_text(text: String) {
  html.td([attribute.class("border-none")], [html.text(text)])
}

fn view(model: Model) -> Element(Msg) {
  html.div([attribute.class("font-mono")], [
    html.div(
      [attribute.class("navbar")],
      // [attribute.class("navbar bg-primary text-primary-content shadow-sm")],
      [
        html.div([attribute.class("flex-1 text-4xl")], [
          html.text("Defense EV Calculator"),
        ]),
        html.div([attribute.class("flex-none")], [
          // html.button([attribute.class("btn btn-square btn-ghost")], []),
          html.input([
            attribute.class("toggle theme-controller al"),
            attribute.value("light"),
            attribute.type_("checkbox"),
          ]),
        ]),
      ],
    ),

    // html.h1([attribute.class("text-4xl")], [
    //   html.text("Defense EV Calculator"),
    // ]),
    html.div([attribute.class("flex")], [
      html.div(
        [
          attribute.id("config"),
          attribute.class("bg-base-300 rounded-box shadow-md p-4"),
        ],
        [
          // html.div([attribute.class("p-32 w-full max-w-2xl mx-auto space-y-4")], [
          html.div([], [
            html.select(
              [attribute.class("select"), event.on_change(UserUpdatedPokemon)],
              render_pokemon_names(model.config.pokemon_name),
            ),
          ]),
          html.div(
            [
              attribute.class("overflow-x-auto "),
            ],
            [
              html.table([attribute.class("table")], [
                html.tbody([], [
                  html.tr([], [
                    td_text("Base HP:"),
                    td_input(model.config.base_hp),
                    td_text("IVs HP:"),
                    td_input_editable(model.config.hp_iv, UserUpdatedHPIVs),
                  ]),
                  html.tr([], [
                    td_text("Base Def:"),
                    td_input(model.config.base_def),
                    td_text("IVs Def:"),
                    td_input_editable(model.config.def_iv, UserUpdatedDefIVs),
                  ]),
                  html.tr([], [
                    td_text("Base SDef:"),
                    td_input(model.config.base_sdef),
                    td_text("IVs SDef:"),
                    td_input_editable(model.config.sdef_iv, UserUpdatedSDefIVs),
                  ]),
                  html.tr([], [
                    td_text("EVs left:"),
                    td_input_editable(model.config.evs_left, UserUpdatedEVsLeft),
                    td_text("Level:"),
                    td_input_editable(model.config.level, UserUpdatedLevel),
                  ]),
                  html.tr([], [
                    td_text("Nature:"),
                    html.td([], [
                      html.select(
                        [
                          attribute.class(""),
                          event.on_change(UserUpdatedNature),
                        ],
                        render_nature(model.config.nature),
                      ),
                    ]),
                  ]),
                ]),
              ]),
            ],
          ),
          html.div([attribute.class("px-4")], [
            html.div([attribute.class("flex flex-col items-center")], [
              html.div([attribute.class("flex justify-between w-full")], [
                html.text("SDef"),
                html.label([attribute.class(""), attribute.for("bias")], [
                  html.text("Bias:"),
                ]),
                html.text("Def"),
              ]),
              html.div([attribute.class("flex justify-between w-full")], [
                html.span([attribute.class(""), attribute.id("bias")], [
                  html.input([
                    attribute.class("input input-sm "),
                    attribute.disabled(True),
                    attribute.value(
                      int.to_string(100 - model.config.bias) <> "%",
                    ),
                  ]),
                ]),
                html.input([
                  attribute.class("range range-xs"),
                  event.on_input(UserUpdatedBias),
                  attribute.value(int.to_string(model.config.bias)),
                  attribute.min("0"),
                  attribute.max("100"),
                  attribute.step("1"),
                  attribute.name("bias"),
                  attribute.id("bias"),
                  attribute.type_("range"),
                ]),
                // html.span([attribute.id("bias")], [
                //   html.text(float.to_string(model.config.bias)),
                // ]),
                html.span([attribute.id("bias")], [
                  html.input([
                    attribute.class("input input-xs"),
                    attribute.disabled(True),

                    attribute.value(int.to_string(model.config.bias) <> "%"),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ],
      ),
      html.div(
        [
          attribute.id("results"),
          attribute.class(""),
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
                  td_text(int.to_string(model.results.hp_stat)),
                ]),
                html.tr([], [
                  td_text("SDef:"),
                  td_text(int.to_string(model.results.sdef_evs)),
                  td_text(int.to_string(model.results.sdef_stat)),
                  td_text(int.to_string(-1)),
                ]),
                html.tr([], [
                  td_text("Nature:"),
                  td_text(nature_to_string(model.results.nature)),
                ]),
              ]),
            ]),
          ]),
        ],
      ),
    ]),
  ])
}
