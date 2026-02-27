# Defense EV Calculator

Simple web app for calculating EVs that minimize the ***Biased Overall Harm*** formula found in this smogon article: https://www.smogon.com/dp/articles/maximizing_defenses

Also displays the calculated ***Defensive Tier*** as defined in this smogon forum post: https://www.smogon.com/forums/threads/defense-and-special-defense-tiers.24931/


## Config

CSS is using [DaisyUI](https://daisyui.com). Download the .mjs source files and place into `src/vendor`

```sh
mkdir -p src/vendor
curl -sLo src/vendor/daisyui.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLo src/vendor/daisyui-theme.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs
```

## Development

```sh
gleam run -m lustre/dev start   # Local Development
gleam test  # Run the tests
```
