import gleam/int

import gleam_community/maths

pub type NatureOption {
  FindBestOption
  NeutralOption
  IncreaseDefOption
  IncreaseSDefOption
  DecreaseDefOption
  DecreaseSDefOption
}

pub type Nature {
  Neutral
  IncreaseDef
  IncreaseSDef
  DecreaseDef
  DecreaseSDef
}

pub type Results {
  Results(
    hp_evs: Int,
    def_evs: Int,
    sdef_evs: Int,
    hp_stat: Int,
    def_stat: Int,
    sdef_stat: Int,
    nature: Nature,
    def_tier: Float,
    sdef_tier: Float,
  )
}

pub type PkmnConfig {
  PkmnConfig(
    pokemon_name: String,
    base_hp: Int,
    base_def: Int,
    base_sdef: Int,
    hp_iv: Int,
    def_iv: Int,
    sdef_iv: Int,
    evs_left: Int,
    level: Int,
    nature_option: NatureOption,
    bias: Int,
  )
}

pub fn calc_results(config: PkmnConfig) {
  let initial = #(
    999.0,
    Results(
      hp_evs: 1,
      def_evs: 1,
      sdef_evs: 1,
      hp_stat: 1,
      def_stat: 1,
      sdef_stat: 1,
      nature: Neutral,
      def_tier: -1.0,
      sdef_tier: -1.0,
    ),
  )
  let #(_, res) = case config.nature_option {
    FindBestOption -> {
      let #(def_harm, def_res) = run_calc_results(initial, IncreaseDef, config)
      let #(sdef_harm, sdef_res) =
        run_calc_results(initial, IncreaseSDef, config)

      case def_harm <. sdef_harm {
        True -> #(def_harm, def_res)
        False -> #(sdef_harm, sdef_res)
      }
    }
    NeutralOption -> run_calc_results(initial, Neutral, config)
    IncreaseDefOption -> run_calc_results(initial, IncreaseDef, config)
    IncreaseSDefOption -> run_calc_results(initial, IncreaseSDef, config)
    DecreaseDefOption -> run_calc_results(initial, DecreaseDef, config)
    DecreaseSDefOption -> run_calc_results(initial, DecreaseSDef, config)
  }

  // add in tiers
  let assert Ok(def_tier) = calc_defensive_tier(res.hp_stat, res.def_stat)
  let assert Ok(sdef_tier) = calc_defensive_tier(res.hp_stat, res.sdef_stat)
  Results(..res, def_tier:, sdef_tier:)
}

/// Cycles through all possible EV distributions to give you the one that provides you with the lowest possible Overall Harm
fn run_calc_results(initial: #(Float, Results), nature, config: PkmnConfig) {
  let #(def_nature, sdef_nature) = case nature {
    Neutral -> #(10, 10)
    IncreaseDef -> #(11, 10)
    IncreaseSDef -> #(10, 11)
    DecreaseDef -> #(9, 10)
    DecreaseSDef -> #(10, 9)
  }

  let bias_float = int.to_float(config.bias) /. 100.0

  let n = config.evs_left / 4
  let def_max = int.min(63, n)

  int.range(from: def_max, to: -1, with: initial, run: fn(acc_outer, def_evs) {
    let sdef_max = int.min(63, n - def_evs)

    let def_evs = def_evs * 4
    int.range(from: sdef_max, to: -1, with: acc_outer, run: fn(acc, sdef_evs) {
      let sdef_evs = sdef_evs * 4
      let hp_evs = n * 4 - def_evs - sdef_evs
      case hp_evs < 256 {
        True -> {
          let def_stat =
            calc_stat(
              config.base_def,
              def_evs,
              config.def_iv,
              config.level,
              def_nature,
            )
          let sdef_stat =
            calc_stat(
              config.base_sdef,
              sdef_evs,
              config.sdef_iv,
              config.level,
              sdef_nature,
            )
          let hp_stat =
            calc_hp(config.base_hp, hp_evs, config.hp_iv, config.level)

          let overall_harm =
            calc_overall_harm_float(
              int.to_float(def_stat),
              int.to_float(sdef_stat),
              int.to_float(hp_stat),
              bias_float,
            )

          case overall_harm <. acc.0 {
            True -> {
              #(
                overall_harm,
                Results(
                  ..acc.1,
                  hp_evs:,
                  def_evs:,
                  sdef_evs:,
                  hp_stat:,
                  def_stat:,
                  sdef_stat:,
                  nature:,
                ),
              )
            }
            False -> acc
          }
        }
        False -> acc
      }
    })
  })
}

fn calc_defensive_tier(hp: Int, stat: Int) {
  maths.logarithm(int.to_float(int.multiply(hp, stat)), 1.1)
}

/// https://www.smogon.com/dp/articles/maximizing_defenses
/// Biased Overall Harm = (2B)[(k + 2D) ÷ HD] + (2 – 2B)[(k + 2S) ÷ HS]
/// k is a constant representing the damage being dealt by the foe (set to 20000)
/// D is your Defense stat
/// S is your Special Defense stat
/// H is your HP stat
/// I is 2/3 if your Pokemon has the Intimidate trait, 1 otherwise
/// B is bias, a number between 0 and 1 inclusive, which provides the degree of bias you want from the physical side
pub fn calc_overall_harm_float(d: Float, s: Float, h: Float, b: Float) -> Float {
  // TODO The value of K DOES MATTER. Investigate if k values within a certain range (determine the typical range of what they "would" be from damage and if it makes a difference)
  let k = 20_000.0

  { 2.0 *. b }
  *. { { k +. 2.0 *. d } /. { h *. d } }
  +. { 2.0 -. 2.0 *. b }
  *. { { k +. 2.0 *. s } /. { h *. s } }
}

/// https://bulbapedia.bulbagarden.net/wiki/Stat
/// NOTE using nature as int here to keep calculation all ints
fn calc_stat(base: Int, ev: Int, iv: Int, level: Int, nature: Int) {
  { { { { { 2 * base + iv + ev / 4 } * level } / 100 } + 5 } * nature } / 10
}

/// https://bulbapedia.bulbagarden.net/wiki/Stat
pub fn calc_hp(base: Int, ev: Int, iv: Int, level: Int) {
  { { { 2 * base + iv + ev / 4 } * level } / 100 } + level + 10
}
