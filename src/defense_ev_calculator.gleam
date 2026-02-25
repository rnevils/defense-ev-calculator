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
  UserUpdatedEVsLeft(String)
  UserUpdatedNature(String)
  UserUpdatedBias(String)
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
      let bias = get_float(bias_string)
      calcs.PkmnConfig(..model.config, bias:)
    }
    UserUpdatedNature(nature_string) -> {
      let nature = string_to_nature(nature_string)
      calcs.PkmnConfig(..model.config, nature:)
    }
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
    bias: 0.5,
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

fn view(model: Model) -> Element(Msg) {
  html.div([], [
    html.h1([], [html.text("Defense EV Calculator")]),
    html.div([], [
      html.select(
        [event.on_change(UserUpdatedPokemon)],
        render_pokemon_names(model.config.pokemon_name),
      ),
    ]),
    html.div([], [
      html.div([], [
        html.text("Base HP:"),
        html.input([
          attribute.disabled(True),
          attribute.value(int.to_string(model.config.base_hp)),
        ]),
        html.text("IVs HP:"),
        html.input([
          attribute.value(int.to_string(model.config.hp_iv)),
        ]),
      ]),
      html.div([], [
        html.text("Base Def:"),
        html.input([
          attribute.disabled(True),
          attribute.value(int.to_string(model.config.base_def)),
        ]),
        html.text("IVs Def:"),
        html.input([
          attribute.value(int.to_string(model.config.def_iv)),
        ]),
      ]),
      html.div([], [
        html.text("Base SDef:"),
        html.input([
          attribute.disabled(True),
          attribute.value(int.to_string(model.config.base_sdef)),
        ]),
        html.text("IVs SDef:"),
        html.input([
          attribute.value(int.to_string(model.config.def_iv)),
        ]),
      ]),
      html.div([], [
        html.text("EVs left:"),
        html.input([
          event.on_input(UserUpdatedEVsLeft),
          attribute.value(int.to_string(model.config.evs_left)),
        ]),
        html.text("Level:"),
        html.input([
          attribute.value(int.to_string(model.config.level)),
        ]),
      ]),
      html.div([], [html.text("Nature:")]),
      html.div([], [
        html.select(
          [event.on_change(UserUpdatedNature)],
          render_nature(model.config.nature),
        ),
      ]),
      html.div([], [
        html.label([attribute.for("bias")], [html.text("Bias:")]),
        html.input([
          event.on_input(UserUpdatedBias),
          attribute.value(float.to_string(model.config.bias)),
          attribute.min("0.0"),
          attribute.max("1.0"),
          attribute.step("0.01"),
          attribute.name("bias"),
          attribute.id("bias"),
          attribute.type_("range"),
        ]),
        html.span([attribute.id("bias")], [
          html.text(float.to_string(model.config.bias)),
        ]),
      ]),
    ]),
    html.div([], [
      html.h1([], [html.text("Results")]),
      html.div([], [
        html.text("HP EVs: "),
        html.text(int.to_string(model.results.hp_evs)),
      ]),
      html.div([], [
        html.text("Def EVs: "),
        html.text(int.to_string(model.results.def_evs)),
      ]),
      html.div([], [
        html.text("SDef EVs: "),
        html.text(int.to_string(model.results.sdef_evs)),
      ]),
      html.div([], [
        html.text("Nature: "),
        html.text(nature_to_string(model.results.nature)),
      ]),
    ]),
  ])
}
