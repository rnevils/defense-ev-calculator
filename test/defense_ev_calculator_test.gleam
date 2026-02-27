import calcs.{Results}
import gleam/dict
import gleeunit
import pokedex

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn calc_results_test() {
  let data = dict.from_list(pokedex.pokedex)
  let pokemon_name = "Abra"
  let assert Ok(new_mon) = dict.get(data, pokemon_name)

  let input =
    calcs.PkmnConfig(
      pokemon_name:,
      base_hp: new_mon.stats.hp,
      base_def: new_mon.stats.def,
      base_sdef: new_mon.stats.sdef,
      hp_iv: 31,
      def_iv: 31,
      sdef_iv: 31,
      evs_left: 508,
      level: 100,
      nature_option: calcs.NeutralOption,
      bias: 50,
    )

  let output = calcs.calc_results(input)

  assert output
    == Results(
      hp_evs: 252,
      def_evs: 252,
      sdef_evs: 4,
      hp_stat: 254,
      def_stat: 129,
      sdef_stat: 147,
      nature: calcs.Neutral,
      def_tier: 109.08747305614058,
      sdef_tier: 110.45794767580063,
    )
}

pub fn calc_overall_harm_test() {
  // let data = dict.from_list(pokedex.pokedex)
  // let assert Ok(new_mon) = dict.get(data, "Hariyama")

  // Hari case where value of k does matter
  let output = calcs.calc_overall_harm_float(215.0, 215.0, 438.0, 0.5)
  let output2 = calcs.calc_overall_harm_float(217.0, 217.0, 434.0, 0.5)

  assert output <. output2
}
