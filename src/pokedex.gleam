pub type BaseStats {
  BaseStats(hp: Int, def: Int, sdef: Int)
}

pub type Pokemon {
  Pokemon(name: String, stats: BaseStats)
}

pub const pokedex = [
  #(
    "Cascoon",
    Pokemon(name: "Cascoon", stats: BaseStats(hp: 50, def: 55, sdef: 25)),
  ),
  #(
    "Skiploom",
    Pokemon(name: "Skiploom", stats: BaseStats(hp: 55, def: 50, sdef: 65)),
  ),
  #(
    "Rhydon",
    Pokemon(name: "Rhydon", stats: BaseStats(hp: 105, def: 120, sdef: 45)),
  ),
  #(
    "Corphish",
    Pokemon(name: "Corphish", stats: BaseStats(hp: 43, def: 65, sdef: 35)),
  ),
  #(
    "Metapod",
    Pokemon(name: "Metapod", stats: BaseStats(hp: 50, def: 55, sdef: 25)),
  ),
  #(
    "Porygon",
    Pokemon(name: "Porygon", stats: BaseStats(hp: 65, def: 70, sdef: 75)),
  ),
  #(
    "Grovyle",
    Pokemon(name: "Grovyle", stats: BaseStats(hp: 50, def: 45, sdef: 65)),
  ),
  #(
    "Farfetch'd",
    Pokemon(name: "Farfetch'd", stats: BaseStats(hp: 52, def: 55, sdef: 62)),
  ),
  #(
    "Persian",
    Pokemon(name: "Persian", stats: BaseStats(hp: 65, def: 60, sdef: 65)),
  ),
  #(
    "Electrike",
    Pokemon(name: "Electrike", stats: BaseStats(hp: 40, def: 40, sdef: 40)),
  ),
  #(
    "Piloswine",
    Pokemon(name: "Piloswine", stats: BaseStats(hp: 100, def: 80, sdef: 60)),
  ),
  #(
    "Claydol",
    Pokemon(name: "Claydol", stats: BaseStats(hp: 60, def: 105, sdef: 120)),
  ),
  #(
    "Hypno",
    Pokemon(name: "Hypno", stats: BaseStats(hp: 85, def: 70, sdef: 115)),
  ),
  #(
    "Ekans",
    Pokemon(name: "Ekans", stats: BaseStats(hp: 35, def: 44, sdef: 54)),
  ),
  #(
    "Slakoth",
    Pokemon(name: "Slakoth", stats: BaseStats(hp: 60, def: 60, sdef: 35)),
  ),
  #(
    "Wigglytuff",
    Pokemon(name: "Wigglytuff", stats: BaseStats(hp: 140, def: 45, sdef: 50)),
  ),
  #(
    "Shellder",
    Pokemon(name: "Shellder", stats: BaseStats(hp: 30, def: 100, sdef: 25)),
  ),
  #(
    "Shuckle",
    Pokemon(name: "Shuckle", stats: BaseStats(hp: 20, def: 230, sdef: 230)),
  ),
  #(
    "Pikachu",
    Pokemon(name: "Pikachu", stats: BaseStats(hp: 35, def: 40, sdef: 50)),
  ),
  #(
    "Arcanine",
    Pokemon(name: "Arcanine", stats: BaseStats(hp: 90, def: 80, sdef: 80)),
  ),
  #(
    "Kecleon",
    Pokemon(name: "Kecleon", stats: BaseStats(hp: 60, def: 70, sdef: 120)),
  ),
  #(
    "Lileep",
    Pokemon(name: "Lileep", stats: BaseStats(hp: 66, def: 77, sdef: 87)),
  ),
  #(
    "Venusaur",
    Pokemon(name: "Venusaur", stats: BaseStats(hp: 80, def: 83, sdef: 100)),
  ),
  #(
    "Spearow",
    Pokemon(name: "Spearow", stats: BaseStats(hp: 40, def: 30, sdef: 31)),
  ),
  #(
    "Qwilfish",
    Pokemon(name: "Qwilfish", stats: BaseStats(hp: 65, def: 85, sdef: 55)),
  ),
  #(
    "Silcoon",
    Pokemon(name: "Silcoon", stats: BaseStats(hp: 50, def: 55, sdef: 25)),
  ),
  #(
    "Weepinbell",
    Pokemon(name: "Weepinbell", stats: BaseStats(hp: 65, def: 50, sdef: 45)),
  ),
  #(
    "Growlithe",
    Pokemon(name: "Growlithe", stats: BaseStats(hp: 55, def: 45, sdef: 50)),
  ),
  #(
    "Cloyster",
    Pokemon(name: "Cloyster", stats: BaseStats(hp: 50, def: 180, sdef: 45)),
  ),
  #(
    "Poliwag",
    Pokemon(name: "Poliwag", stats: BaseStats(hp: 40, def: 40, sdef: 40)),
  ),
  #(
    "Espeon",
    Pokemon(name: "Espeon", stats: BaseStats(hp: 65, def: 60, sdef: 95)),
  ),
  #(
    "Sunkern",
    Pokemon(name: "Sunkern", stats: BaseStats(hp: 30, def: 30, sdef: 30)),
  ),
  #(
    "Aerodactyl",
    Pokemon(name: "Aerodactyl", stats: BaseStats(hp: 80, def: 65, sdef: 75)),
  ),
  #(
    "Ninjask",
    Pokemon(name: "Ninjask", stats: BaseStats(hp: 61, def: 45, sdef: 50)),
  ),
  #(
    "Celebi",
    Pokemon(name: "Celebi", stats: BaseStats(hp: 100, def: 100, sdef: 100)),
  ),
  #(
    "Kingler",
    Pokemon(name: "Kingler", stats: BaseStats(hp: 55, def: 115, sdef: 50)),
  ),
  #(
    "Luvdisc",
    Pokemon(name: "Luvdisc", stats: BaseStats(hp: 43, def: 55, sdef: 65)),
  ),
  #(
    "Tentacruel",
    Pokemon(name: "Tentacruel", stats: BaseStats(hp: 80, def: 65, sdef: 120)),
  ),
  #(
    "Bulbasaur",
    Pokemon(name: "Bulbasaur", stats: BaseStats(hp: 45, def: 49, sdef: 65)),
  ),
  #(
    "Octillery",
    Pokemon(name: "Octillery", stats: BaseStats(hp: 75, def: 75, sdef: 75)),
  ),
  #(
    "Parasect",
    Pokemon(name: "Parasect", stats: BaseStats(hp: 60, def: 80, sdef: 80)),
  ),
  #(
    "Dratini",
    Pokemon(name: "Dratini", stats: BaseStats(hp: 41, def: 45, sdef: 50)),
  ),
  #(
    "Cacturne",
    Pokemon(name: "Cacturne", stats: BaseStats(hp: 70, def: 60, sdef: 60)),
  ),
  #(
    "Geodude",
    Pokemon(name: "Geodude", stats: BaseStats(hp: 40, def: 100, sdef: 30)),
  ),
  #("Muk", Pokemon(name: "Muk", stats: BaseStats(hp: 105, def: 75, sdef: 100))),
  #(
    "Castform",
    Pokemon(name: "Castform", stats: BaseStats(hp: 70, def: 70, sdef: 70)),
  ),
  #(
    "Sneasel",
    Pokemon(name: "Sneasel", stats: BaseStats(hp: 55, def: 55, sdef: 75)),
  ),
  #(
    "Feraligatr",
    Pokemon(name: "Feraligatr", stats: BaseStats(hp: 85, def: 100, sdef: 83)),
  ),
  #(
    "Teddiursa",
    Pokemon(name: "Teddiursa", stats: BaseStats(hp: 60, def: 50, sdef: 50)),
  ),
  #(
    "Meditite",
    Pokemon(name: "Meditite", stats: BaseStats(hp: 30, def: 55, sdef: 55)),
  ),
  #(
    "Smeargle",
    Pokemon(name: "Smeargle", stats: BaseStats(hp: 55, def: 35, sdef: 45)),
  ),
  #(
    "Horsea",
    Pokemon(name: "Horsea", stats: BaseStats(hp: 30, def: 70, sdef: 25)),
  ),
  #(
    "Kabuto",
    Pokemon(name: "Kabuto", stats: BaseStats(hp: 30, def: 90, sdef: 45)),
  ),
  #(
    "Taillow",
    Pokemon(name: "Taillow", stats: BaseStats(hp: 40, def: 30, sdef: 30)),
  ),
  #(
    "Scizor",
    Pokemon(name: "Scizor", stats: BaseStats(hp: 70, def: 100, sdef: 80)),
  ),
  #(
    "Cradily",
    Pokemon(name: "Cradily", stats: BaseStats(hp: 86, def: 97, sdef: 107)),
  ),
  #(
    "Girafarig",
    Pokemon(name: "Girafarig", stats: BaseStats(hp: 70, def: 65, sdef: 65)),
  ),
  #(
    "Nosepass",
    Pokemon(name: "Nosepass", stats: BaseStats(hp: 30, def: 135, sdef: 90)),
  ),
  #(
    "Seadra",
    Pokemon(name: "Seadra", stats: BaseStats(hp: 55, def: 95, sdef: 45)),
  ),
  #(
    "Blastoise",
    Pokemon(name: "Blastoise", stats: BaseStats(hp: 79, def: 100, sdef: 105)),
  ),
  #(
    "Drowzee",
    Pokemon(name: "Drowzee", stats: BaseStats(hp: 60, def: 45, sdef: 90)),
  ),
  #(
    "Deoxys",
    Pokemon(name: "Deoxys", stats: BaseStats(hp: 50, def: 50, sdef: 50)),
  ),
  #(
    "Clamperl",
    Pokemon(name: "Clamperl", stats: BaseStats(hp: 35, def: 85, sdef: 55)),
  ),
  #(
    "Clefable",
    Pokemon(name: "Clefable", stats: BaseStats(hp: 95, def: 73, sdef: 90)),
  ),
  #(
    "Nidoqueen",
    Pokemon(name: "Nidoqueen", stats: BaseStats(hp: 90, def: 87, sdef: 85)),
  ),
  #(
    "Vileplume",
    Pokemon(name: "Vileplume", stats: BaseStats(hp: 75, def: 85, sdef: 90)),
  ),
  #(
    "Spheal",
    Pokemon(name: "Spheal", stats: BaseStats(hp: 70, def: 50, sdef: 50)),
  ),
  #(
    "Electabuzz",
    Pokemon(name: "Electabuzz", stats: BaseStats(hp: 65, def: 57, sdef: 85)),
  ),
  #(
    "Mankey",
    Pokemon(name: "Mankey", stats: BaseStats(hp: 40, def: 35, sdef: 45)),
  ),
  #(
    "Quilava",
    Pokemon(name: "Quilava", stats: BaseStats(hp: 58, def: 58, sdef: 65)),
  ),
  #(
    "Snorlax",
    Pokemon(name: "Snorlax", stats: BaseStats(hp: 160, def: 65, sdef: 110)),
  ),
  #(
    "Cacnea",
    Pokemon(name: "Cacnea", stats: BaseStats(hp: 50, def: 40, sdef: 40)),
  ),
  #(
    "Meganium",
    Pokemon(name: "Meganium", stats: BaseStats(hp: 80, def: 100, sdef: 100)),
  ),
  #(
    "Cleffa",
    Pokemon(name: "Cleffa", stats: BaseStats(hp: 50, def: 28, sdef: 55)),
  ),
  #(
    "Seaking",
    Pokemon(name: "Seaking", stats: BaseStats(hp: 80, def: 65, sdef: 80)),
  ),
  #(
    "Venomoth",
    Pokemon(name: "Venomoth", stats: BaseStats(hp: 70, def: 60, sdef: 75)),
  ),
  #(
    "Rhyhorn",
    Pokemon(name: "Rhyhorn", stats: BaseStats(hp: 80, def: 95, sdef: 30)),
  ),
  #(
    "Wooper",
    Pokemon(name: "Wooper", stats: BaseStats(hp: 55, def: 45, sdef: 25)),
  ),
  #(
    "Zigzagoon",
    Pokemon(name: "Zigzagoon", stats: BaseStats(hp: 38, def: 41, sdef: 41)),
  ),
  #(
    "Charmeleon",
    Pokemon(name: "Charmeleon", stats: BaseStats(hp: 58, def: 58, sdef: 65)),
  ),
  #(
    "Mantine",
    Pokemon(name: "Mantine", stats: BaseStats(hp: 85, def: 70, sdef: 140)),
  ),
  #(
    "Sharpedo",
    Pokemon(name: "Sharpedo", stats: BaseStats(hp: 70, def: 40, sdef: 40)),
  ),
  #(
    "Aipom",
    Pokemon(name: "Aipom", stats: BaseStats(hp: 55, def: 55, sdef: 55)),
  ),
  #(
    "Barboach",
    Pokemon(name: "Barboach", stats: BaseStats(hp: 50, def: 43, sdef: 41)),
  ),
  #(
    "Torkoal",
    Pokemon(name: "Torkoal", stats: BaseStats(hp: 70, def: 140, sdef: 70)),
  ),
  #(
    "Weedle",
    Pokemon(name: "Weedle", stats: BaseStats(hp: 40, def: 30, sdef: 20)),
  ),
  #(
    "Pupitar",
    Pokemon(name: "Pupitar", stats: BaseStats(hp: 70, def: 70, sdef: 70)),
  ),
  #(
    "Beautifly",
    Pokemon(name: "Beautifly", stats: BaseStats(hp: 60, def: 50, sdef: 50)),
  ),
  #(
    "Swampert",
    Pokemon(name: "Swampert", stats: BaseStats(hp: 100, def: 90, sdef: 90)),
  ),
  #(
    "Dusclops",
    Pokemon(name: "Dusclops", stats: BaseStats(hp: 40, def: 130, sdef: 130)),
  ),
  #(
    "Nidoran♀",
    Pokemon(name: "Nidoran♀", stats: BaseStats(hp: 55, def: 52, sdef: 40)),
  ),
  #(
    "Pinsir",
    Pokemon(name: "Pinsir", stats: BaseStats(hp: 65, def: 100, sdef: 70)),
  ),
  #(
    "Sealeo",
    Pokemon(name: "Sealeo", stats: BaseStats(hp: 90, def: 70, sdef: 70)),
  ),
  #(
    "Kabutops",
    Pokemon(name: "Kabutops", stats: BaseStats(hp: 60, def: 105, sdef: 70)),
  ),
  #(
    "Dragonite",
    Pokemon(name: "Dragonite", stats: BaseStats(hp: 91, def: 95, sdef: 100)),
  ),
  #(
    "Azumarill",
    Pokemon(name: "Azumarill", stats: BaseStats(hp: 100, def: 80, sdef: 80)),
  ),
  #(
    "Bagon",
    Pokemon(name: "Bagon", stats: BaseStats(hp: 45, def: 60, sdef: 30)),
  ),
  #(
    "Carvanha",
    Pokemon(name: "Carvanha", stats: BaseStats(hp: 45, def: 20, sdef: 20)),
  ),
  #(
    "Gengar",
    Pokemon(name: "Gengar", stats: BaseStats(hp: 60, def: 60, sdef: 75)),
  ),
  #(
    "Houndour",
    Pokemon(name: "Houndour", stats: BaseStats(hp: 45, def: 30, sdef: 50)),
  ),
  #(
    "Gastly",
    Pokemon(name: "Gastly", stats: BaseStats(hp: 30, def: 30, sdef: 35)),
  ),
  #(
    "Donphan",
    Pokemon(name: "Donphan", stats: BaseStats(hp: 90, def: 120, sdef: 60)),
  ),
  #(
    "Linoone",
    Pokemon(name: "Linoone", stats: BaseStats(hp: 78, def: 61, sdef: 61)),
  ),
  #(
    "Elekid",
    Pokemon(name: "Elekid", stats: BaseStats(hp: 45, def: 37, sdef: 55)),
  ),
  #(
    "Skitty",
    Pokemon(name: "Skitty", stats: BaseStats(hp: 50, def: 45, sdef: 35)),
  ),
  #(
    "Tropius",
    Pokemon(name: "Tropius", stats: BaseStats(hp: 99, def: 83, sdef: 87)),
  ),
  #(
    "Gloom",
    Pokemon(name: "Gloom", stats: BaseStats(hp: 60, def: 70, sdef: 75)),
  ),
  #(
    "Sceptile",
    Pokemon(name: "Sceptile", stats: BaseStats(hp: 70, def: 65, sdef: 85)),
  ),
  #(
    "Treecko",
    Pokemon(name: "Treecko", stats: BaseStats(hp: 40, def: 35, sdef: 55)),
  ),
  #(
    "Lapras",
    Pokemon(name: "Lapras", stats: BaseStats(hp: 130, def: 80, sdef: 95)),
  ),
  #(
    "Swellow",
    Pokemon(name: "Swellow", stats: BaseStats(hp: 60, def: 60, sdef: 50)),
  ),
  #(
    "Vibrava",
    Pokemon(name: "Vibrava", stats: BaseStats(hp: 50, def: 50, sdef: 50)),
  ),
  #(
    "Houndoom",
    Pokemon(name: "Houndoom", stats: BaseStats(hp: 75, def: 50, sdef: 80)),
  ),
  #(
    "Sentret",
    Pokemon(name: "Sentret", stats: BaseStats(hp: 35, def: 34, sdef: 45)),
  ),
  #(
    "Magcargo",
    Pokemon(name: "Magcargo", stats: BaseStats(hp: 60, def: 120, sdef: 80)),
  ),
  #(
    "Nidoran♂",
    Pokemon(name: "Nidoran♂", stats: BaseStats(hp: 46, def: 40, sdef: 40)),
  ),
  #(
    "Igglybuff",
    Pokemon(name: "Igglybuff", stats: BaseStats(hp: 90, def: 15, sdef: 20)),
  ),
  #(
    "Caterpie",
    Pokemon(name: "Caterpie", stats: BaseStats(hp: 45, def: 35, sdef: 20)),
  ),
  #(
    "Pidgeotto",
    Pokemon(name: "Pidgeotto", stats: BaseStats(hp: 63, def: 55, sdef: 50)),
  ),
  #(
    "Shiftry",
    Pokemon(name: "Shiftry", stats: BaseStats(hp: 90, def: 60, sdef: 60)),
  ),
  #(
    "Volbeat",
    Pokemon(name: "Volbeat", stats: BaseStats(hp: 65, def: 75, sdef: 85)),
  ),
  #(
    "Magneton",
    Pokemon(name: "Magneton", stats: BaseStats(hp: 50, def: 95, sdef: 70)),
  ),
  #(
    "Gyarados",
    Pokemon(name: "Gyarados", stats: BaseStats(hp: 95, def: 79, sdef: 100)),
  ),
  #(
    "Magby",
    Pokemon(name: "Magby", stats: BaseStats(hp: 45, def: 37, sdef: 55)),
  ),
  #(
    "Shelgon",
    Pokemon(name: "Shelgon", stats: BaseStats(hp: 65, def: 100, sdef: 50)),
  ),
  #(
    "Scyther",
    Pokemon(name: "Scyther", stats: BaseStats(hp: 70, def: 80, sdef: 80)),
  ),
  #(
    "Bellossom",
    Pokemon(name: "Bellossom", stats: BaseStats(hp: 75, def: 95, sdef: 100)),
  ),
  #(
    "Ditto",
    Pokemon(name: "Ditto", stats: BaseStats(hp: 48, def: 48, sdef: 48)),
  ),
  #("Xatu", Pokemon(name: "Xatu", stats: BaseStats(hp: 65, def: 70, sdef: 70))),
  #(
    "Wingull",
    Pokemon(name: "Wingull", stats: BaseStats(hp: 40, def: 30, sdef: 30)),
  ),
  #(
    "Magikarp",
    Pokemon(name: "Magikarp", stats: BaseStats(hp: 20, def: 55, sdef: 20)),
  ),
  #(
    "Sandshrew",
    Pokemon(name: "Sandshrew", stats: BaseStats(hp: 50, def: 85, sdef: 30)),
  ),
  #(
    "Minun",
    Pokemon(name: "Minun", stats: BaseStats(hp: 60, def: 50, sdef: 85)),
  ),
  #(
    "Ledian",
    Pokemon(name: "Ledian", stats: BaseStats(hp: 55, def: 50, sdef: 110)),
  ),
  #(
    "Hitmonchan",
    Pokemon(name: "Hitmonchan", stats: BaseStats(hp: 50, def: 79, sdef: 110)),
  ),
  #(
    "Marill",
    Pokemon(name: "Marill", stats: BaseStats(hp: 70, def: 50, sdef: 50)),
  ),
  #(
    "Grumpig",
    Pokemon(name: "Grumpig", stats: BaseStats(hp: 80, def: 65, sdef: 110)),
  ),
  #(
    "Machamp",
    Pokemon(name: "Machamp", stats: BaseStats(hp: 90, def: 80, sdef: 85)),
  ),
  #(
    "Lombre",
    Pokemon(name: "Lombre", stats: BaseStats(hp: 60, def: 50, sdef: 70)),
  ),
  #(
    "Mr. Mime",
    Pokemon(name: "Mr. Mime", stats: BaseStats(hp: 40, def: 65, sdef: 120)),
  ),
  #(
    "Forretress",
    Pokemon(name: "Forretress", stats: BaseStats(hp: 75, def: 140, sdef: 60)),
  ),
  #(
    "Magmar",
    Pokemon(name: "Magmar", stats: BaseStats(hp: 65, def: 57, sdef: 85)),
  ),
  #(
    "Granbull",
    Pokemon(name: "Granbull", stats: BaseStats(hp: 90, def: 75, sdef: 60)),
  ),
  #(
    "Kangaskhan",
    Pokemon(name: "Kangaskhan", stats: BaseStats(hp: 105, def: 80, sdef: 80)),
  ),
  #(
    "Golem",
    Pokemon(name: "Golem", stats: BaseStats(hp: 80, def: 130, sdef: 65)),
  ),
  #(
    "Butterfree",
    Pokemon(name: "Butterfree", stats: BaseStats(hp: 60, def: 50, sdef: 80)),
  ),
  #(
    "Glalie",
    Pokemon(name: "Glalie", stats: BaseStats(hp: 80, def: 80, sdef: 80)),
  ),
  #(
    "Wobbuffet",
    Pokemon(name: "Wobbuffet", stats: BaseStats(hp: 190, def: 58, sdef: 58)),
  ),
  #(
    "Duskull",
    Pokemon(name: "Duskull", stats: BaseStats(hp: 20, def: 90, sdef: 90)),
  ),
  #(
    "Sunflora",
    Pokemon(name: "Sunflora", stats: BaseStats(hp: 75, def: 55, sdef: 85)),
  ),
  #(
    "Charizard",
    Pokemon(name: "Charizard", stats: BaseStats(hp: 78, def: 78, sdef: 85)),
  ),
  #(
    "Makuhita",
    Pokemon(name: "Makuhita", stats: BaseStats(hp: 72, def: 30, sdef: 30)),
  ),
  #(
    "Vigoroth",
    Pokemon(name: "Vigoroth", stats: BaseStats(hp: 80, def: 80, sdef: 55)),
  ),
  #(
    "Hariyama",
    Pokemon(name: "Hariyama", stats: BaseStats(hp: 144, def: 60, sdef: 60)),
  ),
  #(
    "Chikorita",
    Pokemon(name: "Chikorita", stats: BaseStats(hp: 45, def: 65, sdef: 65)),
  ),
  #(
    "Mewtwo",
    Pokemon(name: "Mewtwo", stats: BaseStats(hp: 106, def: 90, sdef: 90)),
  ),
  #(
    "Dunsparce",
    Pokemon(name: "Dunsparce", stats: BaseStats(hp: 100, def: 70, sdef: 65)),
  ),
  #(
    "Ledyba",
    Pokemon(name: "Ledyba", stats: BaseStats(hp: 40, def: 30, sdef: 80)),
  ),
  #(
    "Wailmer",
    Pokemon(name: "Wailmer", stats: BaseStats(hp: 130, def: 35, sdef: 35)),
  ),
  #(
    "Electrode",
    Pokemon(name: "Electrode", stats: BaseStats(hp: 60, def: 70, sdef: 80)),
  ),
  #(
    "Flareon",
    Pokemon(name: "Flareon", stats: BaseStats(hp: 65, def: 60, sdef: 110)),
  ),
  #(
    "Unown",
    Pokemon(name: "Unown", stats: BaseStats(hp: 48, def: 48, sdef: 48)),
  ),
  #(
    "Numel",
    Pokemon(name: "Numel", stats: BaseStats(hp: 60, def: 40, sdef: 45)),
  ),
  #(
    "Charmander",
    Pokemon(name: "Charmander", stats: BaseStats(hp: 39, def: 43, sdef: 50)),
  ),
  #(
    "Anorith",
    Pokemon(name: "Anorith", stats: BaseStats(hp: 45, def: 50, sdef: 50)),
  ),
  #(
    "Arbok",
    Pokemon(name: "Arbok", stats: BaseStats(hp: 60, def: 69, sdef: 79)),
  ),
  #(
    "Squirtle",
    Pokemon(name: "Squirtle", stats: BaseStats(hp: 44, def: 65, sdef: 64)),
  ),
  #(
    "Lunatone",
    Pokemon(name: "Lunatone", stats: BaseStats(hp: 90, def: 65, sdef: 85)),
  ),
  #(
    "Hoppip",
    Pokemon(name: "Hoppip", stats: BaseStats(hp: 35, def: 40, sdef: 55)),
  ),
  #(
    "Tauros",
    Pokemon(name: "Tauros", stats: BaseStats(hp: 75, def: 95, sdef: 70)),
  ),
  #(
    "Whiscash",
    Pokemon(name: "Whiscash", stats: BaseStats(hp: 110, def: 73, sdef: 71)),
  ),
  #(
    "Shroomish",
    Pokemon(name: "Shroomish", stats: BaseStats(hp: 60, def: 60, sdef: 60)),
  ),
  #(
    "Nincada",
    Pokemon(name: "Nincada", stats: BaseStats(hp: 31, def: 90, sdef: 30)),
  ),
  #(
    "Chimecho",
    Pokemon(name: "Chimecho", stats: BaseStats(hp: 75, def: 80, sdef: 90)),
  ),
  #(
    "Latios",
    Pokemon(name: "Latios", stats: BaseStats(hp: 80, def: 80, sdef: 110)),
  ),
  #(
    "Feebas",
    Pokemon(name: "Feebas", stats: BaseStats(hp: 20, def: 20, sdef: 55)),
  ),
  #(
    "Pidgeot",
    Pokemon(name: "Pidgeot", stats: BaseStats(hp: 83, def: 75, sdef: 70)),
  ),
  #(
    "Goldeen",
    Pokemon(name: "Goldeen", stats: BaseStats(hp: 45, def: 60, sdef: 50)),
  ),
  #("Onix", Pokemon(name: "Onix", stats: BaseStats(hp: 35, def: 160, sdef: 45))),
  #(
    "Phanpy",
    Pokemon(name: "Phanpy", stats: BaseStats(hp: 90, def: 60, sdef: 40)),
  ),
  #(
    "Staryu",
    Pokemon(name: "Staryu", stats: BaseStats(hp: 30, def: 55, sdef: 55)),
  ),
  #(
    "Medicham",
    Pokemon(name: "Medicham", stats: BaseStats(hp: 60, def: 75, sdef: 75)),
  ),
  #(
    "Blaziken",
    Pokemon(name: "Blaziken", stats: BaseStats(hp: 80, def: 70, sdef: 70)),
  ),
  #(
    "Swablu",
    Pokemon(name: "Swablu", stats: BaseStats(hp: 45, def: 60, sdef: 75)),
  ),
  #(
    "Psyduck",
    Pokemon(name: "Psyduck", stats: BaseStats(hp: 50, def: 48, sdef: 50)),
  ),
  #(
    "Oddish",
    Pokemon(name: "Oddish", stats: BaseStats(hp: 45, def: 55, sdef: 65)),
  ),
  #(
    "Haunter",
    Pokemon(name: "Haunter", stats: BaseStats(hp: 45, def: 45, sdef: 55)),
  ),
  #(
    "Absol",
    Pokemon(name: "Absol", stats: BaseStats(hp: 65, def: 60, sdef: 60)),
  ),
  #(
    "Whismur",
    Pokemon(name: "Whismur", stats: BaseStats(hp: 64, def: 23, sdef: 23)),
  ),
  #(
    "Entei",
    Pokemon(name: "Entei", stats: BaseStats(hp: 115, def: 85, sdef: 75)),
  ),
  #(
    "Exploud",
    Pokemon(name: "Exploud", stats: BaseStats(hp: 104, def: 63, sdef: 73)),
  ),
  #(
    "Shuppet",
    Pokemon(name: "Shuppet", stats: BaseStats(hp: 44, def: 35, sdef: 33)),
  ),
  #(
    "Banette",
    Pokemon(name: "Banette", stats: BaseStats(hp: 64, def: 65, sdef: 63)),
  ),
  #(
    "Milotic",
    Pokemon(name: "Milotic", stats: BaseStats(hp: 95, def: 79, sdef: 125)),
  ),
  #(
    "Suicune",
    Pokemon(name: "Suicune", stats: BaseStats(hp: 100, def: 115, sdef: 115)),
  ),
  #(
    "Shedinja",
    Pokemon(name: "Shedinja", stats: BaseStats(hp: 1, def: 45, sdef: 30)),
  ),
  #(
    "Aggron",
    Pokemon(name: "Aggron", stats: BaseStats(hp: 70, def: 180, sdef: 60)),
  ),
  #(
    "Wurmple",
    Pokemon(name: "Wurmple", stats: BaseStats(hp: 45, def: 35, sdef: 30)),
  ),
  #("Aron", Pokemon(name: "Aron", stats: BaseStats(hp: 50, def: 100, sdef: 40))),
  #(
    "Pidgey",
    Pokemon(name: "Pidgey", stats: BaseStats(hp: 40, def: 40, sdef: 35)),
  ),
  #("Abra", Pokemon(name: "Abra", stats: BaseStats(hp: 25, def: 15, sdef: 55))),
  #(
    "Nidorina",
    Pokemon(name: "Nidorina", stats: BaseStats(hp: 70, def: 67, sdef: 55)),
  ),
  #(
    "Kirlia",
    Pokemon(name: "Kirlia", stats: BaseStats(hp: 38, def: 35, sdef: 55)),
  ),
  #(
    "Manectric",
    Pokemon(name: "Manectric", stats: BaseStats(hp: 70, def: 60, sdef: 60)),
  ),
  #(
    "Delcatty",
    Pokemon(name: "Delcatty", stats: BaseStats(hp: 70, def: 65, sdef: 55)),
  ),
  #(
    "Marowak",
    Pokemon(name: "Marowak", stats: BaseStats(hp: 60, def: 110, sdef: 80)),
  ),
  #(
    "Machoke",
    Pokemon(name: "Machoke", stats: BaseStats(hp: 80, def: 70, sdef: 60)),
  ),
  #(
    "Huntail",
    Pokemon(name: "Huntail", stats: BaseStats(hp: 55, def: 105, sdef: 75)),
  ),
  #(
    "Golbat",
    Pokemon(name: "Golbat", stats: BaseStats(hp: 75, def: 70, sdef: 75)),
  ),
  #(
    "Nuzleaf",
    Pokemon(name: "Nuzleaf", stats: BaseStats(hp: 70, def: 40, sdef: 40)),
  ),
  #(
    "Jigglypuff",
    Pokemon(name: "Jigglypuff", stats: BaseStats(hp: 115, def: 20, sdef: 25)),
  ),
  #(
    "Marshtomp",
    Pokemon(name: "Marshtomp", stats: BaseStats(hp: 70, def: 70, sdef: 70)),
  ),
  #(
    "Venonat",
    Pokemon(name: "Venonat", stats: BaseStats(hp: 60, def: 50, sdef: 55)),
  ),
  #(
    "Baltoy",
    Pokemon(name: "Baltoy", stats: BaseStats(hp: 40, def: 55, sdef: 70)),
  ),
  #(
    "Noctowl",
    Pokemon(name: "Noctowl", stats: BaseStats(hp: 100, def: 50, sdef: 96)),
  ),
  #(
    "Togepi",
    Pokemon(name: "Togepi", stats: BaseStats(hp: 35, def: 65, sdef: 65)),
  ),
  #(
    "Gorebyss",
    Pokemon(name: "Gorebyss", stats: BaseStats(hp: 55, def: 105, sdef: 75)),
  ),
  #(
    "Vulpix",
    Pokemon(name: "Vulpix", stats: BaseStats(hp: 38, def: 40, sdef: 65)),
  ),
  #(
    "Mareep",
    Pokemon(name: "Mareep", stats: BaseStats(hp: 55, def: 40, sdef: 45)),
  ),
  #(
    "Armaldo",
    Pokemon(name: "Armaldo", stats: BaseStats(hp: 75, def: 100, sdef: 80)),
  ),
  #(
    "Skarmory",
    Pokemon(name: "Skarmory", stats: BaseStats(hp: 65, def: 140, sdef: 70)),
  ),
  #(
    "Porygon2",
    Pokemon(name: "Porygon2", stats: BaseStats(hp: 85, def: 90, sdef: 95)),
  ),
  #(
    "Altaria",
    Pokemon(name: "Altaria", stats: BaseStats(hp: 75, def: 90, sdef: 105)),
  ),
  #(
    "Groudon",
    Pokemon(name: "Groudon", stats: BaseStats(hp: 100, def: 140, sdef: 90)),
  ),
  #(
    "Zangoose",
    Pokemon(name: "Zangoose", stats: BaseStats(hp: 73, def: 60, sdef: 60)),
  ),
  #(
    "Paras",
    Pokemon(name: "Paras", stats: BaseStats(hp: 35, def: 55, sdef: 55)),
  ),
  #(
    "Stantler",
    Pokemon(name: "Stantler", stats: BaseStats(hp: 73, def: 62, sdef: 65)),
  ),
  #(
    "Blissey",
    Pokemon(name: "Blissey", stats: BaseStats(hp: 255, def: 10, sdef: 135)),
  ),
  #(
    "Beldum",
    Pokemon(name: "Beldum", stats: BaseStats(hp: 40, def: 80, sdef: 60)),
  ),
  #(
    "Misdreavus",
    Pokemon(name: "Misdreavus", stats: BaseStats(hp: 60, def: 60, sdef: 85)),
  ),
  #(
    "Raticate",
    Pokemon(name: "Raticate", stats: BaseStats(hp: 55, def: 60, sdef: 70)),
  ),
  #(
    "Flaaffy",
    Pokemon(name: "Flaaffy", stats: BaseStats(hp: 70, def: 55, sdef: 60)),
  ),
  #(
    "Kakuna",
    Pokemon(name: "Kakuna", stats: BaseStats(hp: 45, def: 50, sdef: 25)),
  ),
  #(
    "Azurill",
    Pokemon(name: "Azurill", stats: BaseStats(hp: 50, def: 40, sdef: 40)),
  ),
  #(
    "Flygon",
    Pokemon(name: "Flygon", stats: BaseStats(hp: 80, def: 80, sdef: 80)),
  ),
  #(
    "Quagsire",
    Pokemon(name: "Quagsire", stats: BaseStats(hp: 95, def: 85, sdef: 65)),
  ),
  #(
    "Surskit",
    Pokemon(name: "Surskit", stats: BaseStats(hp: 40, def: 32, sdef: 52)),
  ),
  #(
    "Plusle",
    Pokemon(name: "Plusle", stats: BaseStats(hp: 60, def: 40, sdef: 75)),
  ),
  #(
    "Hitmonlee",
    Pokemon(name: "Hitmonlee", stats: BaseStats(hp: 50, def: 53, sdef: 110)),
  ),
  #(
    "Doduo",
    Pokemon(name: "Doduo", stats: BaseStats(hp: 35, def: 45, sdef: 35)),
  ),
  #(
    "Tentacool",
    Pokemon(name: "Tentacool", stats: BaseStats(hp: 40, def: 35, sdef: 100)),
  ),
  #(
    "Gligar",
    Pokemon(name: "Gligar", stats: BaseStats(hp: 65, def: 105, sdef: 65)),
  ),
  #(
    "Spoink",
    Pokemon(name: "Spoink", stats: BaseStats(hp: 60, def: 35, sdef: 80)),
  ),
  #(
    "Relicanth",
    Pokemon(name: "Relicanth", stats: BaseStats(hp: 100, def: 130, sdef: 65)),
  ),
  #(
    "Wynaut",
    Pokemon(name: "Wynaut", stats: BaseStats(hp: 95, def: 48, sdef: 48)),
  ),
  #(
    "Wailord",
    Pokemon(name: "Wailord", stats: BaseStats(hp: 170, def: 45, sdef: 45)),
  ),
  #(
    "Bayleef",
    Pokemon(name: "Bayleef", stats: BaseStats(hp: 60, def: 80, sdef: 80)),
  ),
  #(
    "Lotad",
    Pokemon(name: "Lotad", stats: BaseStats(hp: 40, def: 30, sdef: 50)),
  ),
  #("Natu", Pokemon(name: "Natu", stats: BaseStats(hp: 40, def: 45, sdef: 45))),
  #(
    "Heracross",
    Pokemon(name: "Heracross", stats: BaseStats(hp: 80, def: 75, sdef: 95)),
  ),
  #(
    "Swalot",
    Pokemon(name: "Swalot", stats: BaseStats(hp: 100, def: 83, sdef: 83)),
  ),
  #(
    "Meowth",
    Pokemon(name: "Meowth", stats: BaseStats(hp: 40, def: 35, sdef: 40)),
  ),
  #(
    "Totodile",
    Pokemon(name: "Totodile", stats: BaseStats(hp: 50, def: 64, sdef: 48)),
  ),
  #(
    "Poochyena",
    Pokemon(name: "Poochyena", stats: BaseStats(hp: 35, def: 35, sdef: 30)),
  ),
  #(
    "Tangela",
    Pokemon(name: "Tangela", stats: BaseStats(hp: 65, def: 115, sdef: 40)),
  ),
  #(
    "Graveler",
    Pokemon(name: "Graveler", stats: BaseStats(hp: 55, def: 115, sdef: 45)),
  ),
  #(
    "Exeggutor",
    Pokemon(name: "Exeggutor", stats: BaseStats(hp: 95, def: 85, sdef: 75)),
  ),
  #(
    "Typhlosion",
    Pokemon(name: "Typhlosion", stats: BaseStats(hp: 78, def: 78, sdef: 85)),
  ),
  #(
    "Larvitar",
    Pokemon(name: "Larvitar", stats: BaseStats(hp: 50, def: 50, sdef: 50)),
  ),
  #(
    "Solrock",
    Pokemon(name: "Solrock", stats: BaseStats(hp: 90, def: 85, sdef: 65)),
  ),
  #(
    "Sudowoodo",
    Pokemon(name: "Sudowoodo", stats: BaseStats(hp: 70, def: 115, sdef: 65)),
  ),
  #(
    "Togetic",
    Pokemon(name: "Togetic", stats: BaseStats(hp: 55, def: 85, sdef: 105)),
  ),
  #(
    "Salamence",
    Pokemon(name: "Salamence", stats: BaseStats(hp: 95, def: 80, sdef: 80)),
  ),
  #(
    "Roselia",
    Pokemon(name: "Roselia", stats: BaseStats(hp: 50, def: 45, sdef: 80)),
  ),
  #(
    "Omastar",
    Pokemon(name: "Omastar", stats: BaseStats(hp: 70, def: 125, sdef: 70)),
  ),
  #(
    "Combusken",
    Pokemon(name: "Combusken", stats: BaseStats(hp: 60, def: 60, sdef: 60)),
  ),
  #(
    "Chinchou",
    Pokemon(name: "Chinchou", stats: BaseStats(hp: 75, def: 38, sdef: 56)),
  ),
  #(
    "Crobat",
    Pokemon(name: "Crobat", stats: BaseStats(hp: 85, def: 80, sdef: 80)),
  ),
  #(
    "Tyrogue",
    Pokemon(name: "Tyrogue", stats: BaseStats(hp: 35, def: 35, sdef: 35)),
  ),
  #(
    "Chansey",
    Pokemon(name: "Chansey", stats: BaseStats(hp: 250, def: 5, sdef: 105)),
  ),
  #(
    "Exeggcute",
    Pokemon(name: "Exeggcute", stats: BaseStats(hp: 60, def: 80, sdef: 45)),
  ),
  #(
    "Seedot",
    Pokemon(name: "Seedot", stats: BaseStats(hp: 40, def: 50, sdef: 30)),
  ),
  #(
    "Registeel",
    Pokemon(name: "Registeel", stats: BaseStats(hp: 80, def: 150, sdef: 150)),
  ),
  #(
    "Tyranitar",
    Pokemon(name: "Tyranitar", stats: BaseStats(hp: 100, def: 110, sdef: 100)),
  ),
  #(
    "Mudkip",
    Pokemon(name: "Mudkip", stats: BaseStats(hp: 50, def: 50, sdef: 50)),
  ),
  #(
    "Torchic",
    Pokemon(name: "Torchic", stats: BaseStats(hp: 45, def: 40, sdef: 50)),
  ),
  #(
    "Politoed",
    Pokemon(name: "Politoed", stats: BaseStats(hp: 90, def: 75, sdef: 100)),
  ),
  #(
    "Cubone",
    Pokemon(name: "Cubone", stats: BaseStats(hp: 50, def: 95, sdef: 50)),
  ),
  #(
    "Raichu",
    Pokemon(name: "Raichu", stats: BaseStats(hp: 60, def: 55, sdef: 80)),
  ),
  #(
    "Mightyena",
    Pokemon(name: "Mightyena", stats: BaseStats(hp: 70, def: 70, sdef: 60)),
  ),
  #(
    "Eevee",
    Pokemon(name: "Eevee", stats: BaseStats(hp: 55, def: 50, sdef: 65)),
  ),
  #(
    "Swinub",
    Pokemon(name: "Swinub", stats: BaseStats(hp: 50, def: 40, sdef: 30)),
  ),
  #(
    "Masquerain",
    Pokemon(name: "Masquerain", stats: BaseStats(hp: 70, def: 62, sdef: 82)),
  ),
  #(
    "Lugia",
    Pokemon(name: "Lugia", stats: BaseStats(hp: 106, def: 130, sdef: 154)),
  ),
  #(
    "Lanturn",
    Pokemon(name: "Lanturn", stats: BaseStats(hp: 125, def: 58, sdef: 76)),
  ),
  #(
    "Moltres",
    Pokemon(name: "Moltres", stats: BaseStats(hp: 90, def: 90, sdef: 85)),
  ),
  #(
    "Poliwhirl",
    Pokemon(name: "Poliwhirl", stats: BaseStats(hp: 65, def: 65, sdef: 50)),
  ),
  #(
    "Jirachi",
    Pokemon(name: "Jirachi", stats: BaseStats(hp: 100, def: 100, sdef: 100)),
  ),
  #(
    "Breloom",
    Pokemon(name: "Breloom", stats: BaseStats(hp: 60, def: 80, sdef: 60)),
  ),
  #(
    "Ponyta",
    Pokemon(name: "Ponyta", stats: BaseStats(hp: 50, def: 55, sdef: 65)),
  ),
  #(
    "Trapinch",
    Pokemon(name: "Trapinch", stats: BaseStats(hp: 45, def: 45, sdef: 45)),
  ),
  #(
    "Corsola",
    Pokemon(name: "Corsola", stats: BaseStats(hp: 65, def: 95, sdef: 95)),
  ),
  #(
    "Primeape",
    Pokemon(name: "Primeape", stats: BaseStats(hp: 65, def: 60, sdef: 70)),
  ),
  #(
    "Delibird",
    Pokemon(name: "Delibird", stats: BaseStats(hp: 45, def: 45, sdef: 45)),
  ),
  #(
    "Gulpin",
    Pokemon(name: "Gulpin", stats: BaseStats(hp: 70, def: 53, sdef: 53)),
  ),
  #(
    "Pichu",
    Pokemon(name: "Pichu", stats: BaseStats(hp: 20, def: 15, sdef: 35)),
  ),
  #(
    "Ivysaur",
    Pokemon(name: "Ivysaur", stats: BaseStats(hp: 60, def: 63, sdef: 80)),
  ),
  #(
    "Jolteon",
    Pokemon(name: "Jolteon", stats: BaseStats(hp: 65, def: 60, sdef: 95)),
  ),
  #(
    "Raikou",
    Pokemon(name: "Raikou", stats: BaseStats(hp: 90, def: 75, sdef: 100)),
  ),
  #(
    "Jumpluff",
    Pokemon(name: "Jumpluff", stats: BaseStats(hp: 75, def: 70, sdef: 95)),
  ),
  #(
    "Regice",
    Pokemon(name: "Regice", stats: BaseStats(hp: 80, def: 100, sdef: 200)),
  ),
  #(
    "Dewgong",
    Pokemon(name: "Dewgong", stats: BaseStats(hp: 90, def: 80, sdef: 95)),
  ),
  #(
    "Magnemite",
    Pokemon(name: "Magnemite", stats: BaseStats(hp: 25, def: 70, sdef: 55)),
  ),
  #(
    "Dragonair",
    Pokemon(name: "Dragonair", stats: BaseStats(hp: 61, def: 65, sdef: 70)),
  ),
  #(
    "Starmie",
    Pokemon(name: "Starmie", stats: BaseStats(hp: 60, def: 85, sdef: 85)),
  ),
  #(
    "Smoochum",
    Pokemon(name: "Smoochum", stats: BaseStats(hp: 45, def: 15, sdef: 65)),
  ),
  #(
    "Hoothoot",
    Pokemon(name: "Hoothoot", stats: BaseStats(hp: 60, def: 30, sdef: 56)),
  ),
  #(
    "Slowking",
    Pokemon(name: "Slowking", stats: BaseStats(hp: 95, def: 80, sdef: 110)),
  ),
  #(
    "Seviper",
    Pokemon(name: "Seviper", stats: BaseStats(hp: 73, def: 60, sdef: 60)),
  ),
  #(
    "Fearow",
    Pokemon(name: "Fearow", stats: BaseStats(hp: 65, def: 65, sdef: 61)),
  ),
  #(
    "Croconaw",
    Pokemon(name: "Croconaw", stats: BaseStats(hp: 65, def: 80, sdef: 63)),
  ),
  #(
    "Murkrow",
    Pokemon(name: "Murkrow", stats: BaseStats(hp: 60, def: 42, sdef: 42)),
  ),
  #(
    "Kyogre",
    Pokemon(name: "Kyogre", stats: BaseStats(hp: 100, def: 90, sdef: 140)),
  ),
  #(
    "Crawdaunt",
    Pokemon(name: "Crawdaunt", stats: BaseStats(hp: 63, def: 85, sdef: 55)),
  ),
  #(
    "Clefairy",
    Pokemon(name: "Clefairy", stats: BaseStats(hp: 70, def: 48, sdef: 65)),
  ),
  #("Seel", Pokemon(name: "Seel", stats: BaseStats(hp: 65, def: 55, sdef: 70))),
  #(
    "Ampharos",
    Pokemon(name: "Ampharos", stats: BaseStats(hp: 90, def: 85, sdef: 90)),
  ),
  #(
    "Sandslash",
    Pokemon(name: "Sandslash", stats: BaseStats(hp: 75, def: 110, sdef: 55)),
  ),
  #("Jynx", Pokemon(name: "Jynx", stats: BaseStats(hp: 65, def: 35, sdef: 95))),
  #(
    "Sableye",
    Pokemon(name: "Sableye", stats: BaseStats(hp: 50, def: 75, sdef: 65)),
  ),
  #(
    "Beedrill",
    Pokemon(name: "Beedrill", stats: BaseStats(hp: 65, def: 40, sdef: 80)),
  ),
  #(
    "Articuno",
    Pokemon(name: "Articuno", stats: BaseStats(hp: 90, def: 100, sdef: 125)),
  ),
  #(
    "Walrein",
    Pokemon(name: "Walrein", stats: BaseStats(hp: 110, def: 90, sdef: 90)),
  ),
  #(
    "Machop",
    Pokemon(name: "Machop", stats: BaseStats(hp: 70, def: 50, sdef: 35)),
  ),
  #(
    "Rayquaza",
    Pokemon(name: "Rayquaza", stats: BaseStats(hp: 105, def: 90, sdef: 90)),
  ),
  #(
    "Illumise",
    Pokemon(name: "Illumise", stats: BaseStats(hp: 65, def: 75, sdef: 85)),
  ),
  #(
    "Slowpoke",
    Pokemon(name: "Slowpoke", stats: BaseStats(hp: 90, def: 65, sdef: 40)),
  ),
  #(
    "Alakazam",
    Pokemon(name: "Alakazam", stats: BaseStats(hp: 55, def: 45, sdef: 95)),
  ),
  #(
    "Yanma",
    Pokemon(name: "Yanma", stats: BaseStats(hp: 65, def: 45, sdef: 45)),
  ),
  #(
    "Zubat",
    Pokemon(name: "Zubat", stats: BaseStats(hp: 40, def: 35, sdef: 40)),
  ),
  #(
    "Dugtrio",
    Pokemon(name: "Dugtrio", stats: BaseStats(hp: 35, def: 50, sdef: 70)),
  ),
  #(
    "Miltank",
    Pokemon(name: "Miltank", stats: BaseStats(hp: 95, def: 105, sdef: 70)),
  ),
  #(
    "Regirock",
    Pokemon(name: "Regirock", stats: BaseStats(hp: 80, def: 200, sdef: 100)),
  ),
  #(
    "Rapidash",
    Pokemon(name: "Rapidash", stats: BaseStats(hp: 65, def: 70, sdef: 80)),
  ),
  #(
    "Steelix",
    Pokemon(name: "Steelix", stats: BaseStats(hp: 75, def: 200, sdef: 65)),
  ),
  #(
    "Dustox",
    Pokemon(name: "Dustox", stats: BaseStats(hp: 60, def: 70, sdef: 90)),
  ),
  #(
    "Diglett",
    Pokemon(name: "Diglett", stats: BaseStats(hp: 10, def: 25, sdef: 45)),
  ),
  #(
    "Victreebel",
    Pokemon(name: "Victreebel", stats: BaseStats(hp: 80, def: 65, sdef: 70)),
  ),
  #(
    "Gardevoir",
    Pokemon(name: "Gardevoir", stats: BaseStats(hp: 68, def: 65, sdef: 115)),
  ),
  #(
    "Ursaring",
    Pokemon(name: "Ursaring", stats: BaseStats(hp: 90, def: 75, sdef: 75)),
  ),
  #(
    "Ninetales",
    Pokemon(name: "Ninetales", stats: BaseStats(hp: 73, def: 75, sdef: 100)),
  ),
  #(
    "Snubbull",
    Pokemon(name: "Snubbull", stats: BaseStats(hp: 60, def: 50, sdef: 40)),
  ),
  #(
    "Latias",
    Pokemon(name: "Latias", stats: BaseStats(hp: 80, def: 90, sdef: 130)),
  ),
  #(
    "Cyndaquil",
    Pokemon(name: "Cyndaquil", stats: BaseStats(hp: 39, def: 43, sdef: 50)),
  ),
  #(
    "Pineco",
    Pokemon(name: "Pineco", stats: BaseStats(hp: 50, def: 90, sdef: 35)),
  ),
  #(
    "Kingdra",
    Pokemon(name: "Kingdra", stats: BaseStats(hp: 75, def: 95, sdef: 95)),
  ),
  #(
    "Umbreon",
    Pokemon(name: "Umbreon", stats: BaseStats(hp: 95, def: 110, sdef: 130)),
  ),
  #(
    "Ralts",
    Pokemon(name: "Ralts", stats: BaseStats(hp: 28, def: 25, sdef: 35)),
  ),
  #(
    "Hitmontop",
    Pokemon(name: "Hitmontop", stats: BaseStats(hp: 50, def: 95, sdef: 110)),
  ),
  #(
    "Vaporeon",
    Pokemon(name: "Vaporeon", stats: BaseStats(hp: 130, def: 60, sdef: 95)),
  ),
  #(
    "Grimer",
    Pokemon(name: "Grimer", stats: BaseStats(hp: 80, def: 50, sdef: 50)),
  ),
  #(
    "Bellsprout",
    Pokemon(name: "Bellsprout", stats: BaseStats(hp: 50, def: 35, sdef: 30)),
  ),
  #(
    "Nidoking",
    Pokemon(name: "Nidoking", stats: BaseStats(hp: 81, def: 77, sdef: 75)),
  ),
  #(
    "Snorunt",
    Pokemon(name: "Snorunt", stats: BaseStats(hp: 50, def: 50, sdef: 50)),
  ),
  #(
    "Spinarak",
    Pokemon(name: "Spinarak", stats: BaseStats(hp: 40, def: 40, sdef: 40)),
  ),
  #(
    "Camerupt",
    Pokemon(name: "Camerupt", stats: BaseStats(hp: 70, def: 70, sdef: 75)),
  ),
  #(
    "Golduck",
    Pokemon(name: "Golduck", stats: BaseStats(hp: 80, def: 78, sdef: 80)),
  ),
  #(
    "Lairon",
    Pokemon(name: "Lairon", stats: BaseStats(hp: 60, def: 140, sdef: 50)),
  ),
  #(
    "Ludicolo",
    Pokemon(name: "Ludicolo", stats: BaseStats(hp: 80, def: 70, sdef: 100)),
  ),
  #(
    "Koffing",
    Pokemon(name: "Koffing", stats: BaseStats(hp: 40, def: 95, sdef: 45)),
  ),
  #(
    "Lickitung",
    Pokemon(name: "Lickitung", stats: BaseStats(hp: 90, def: 75, sdef: 75)),
  ),
  #(
    "Kadabra",
    Pokemon(name: "Kadabra", stats: BaseStats(hp: 40, def: 30, sdef: 70)),
  ),
  #(
    "Wartortle",
    Pokemon(name: "Wartortle", stats: BaseStats(hp: 59, def: 80, sdef: 80)),
  ),
  #(
    "Voltorb",
    Pokemon(name: "Voltorb", stats: BaseStats(hp: 40, def: 50, sdef: 55)),
  ),
  #(
    "Metang",
    Pokemon(name: "Metang", stats: BaseStats(hp: 60, def: 100, sdef: 80)),
  ),
  #(
    "Nidorino",
    Pokemon(name: "Nidorino", stats: BaseStats(hp: 61, def: 57, sdef: 55)),
  ),
  #(
    "Poliwrath",
    Pokemon(name: "Poliwrath", stats: BaseStats(hp: 90, def: 95, sdef: 90)),
  ),
  #(
    "Furret",
    Pokemon(name: "Furret", stats: BaseStats(hp: 85, def: 64, sdef: 55)),
  ),
  #(
    "Slowbro",
    Pokemon(name: "Slowbro", stats: BaseStats(hp: 95, def: 110, sdef: 80)),
  ),
  #(
    "Remoraid",
    Pokemon(name: "Remoraid", stats: BaseStats(hp: 35, def: 35, sdef: 35)),
  ),
  #(
    "Slaking",
    Pokemon(name: "Slaking", stats: BaseStats(hp: 150, def: 100, sdef: 65)),
  ),
  #(
    "Weezing",
    Pokemon(name: "Weezing", stats: BaseStats(hp: 65, def: 120, sdef: 70)),
  ),
  #(
    "Dodrio",
    Pokemon(name: "Dodrio", stats: BaseStats(hp: 60, def: 70, sdef: 60)),
  ),
  #(
    "Slugma",
    Pokemon(name: "Slugma", stats: BaseStats(hp: 40, def: 40, sdef: 40)),
  ),
  #("Mew", Pokemon(name: "Mew", stats: BaseStats(hp: 100, def: 100, sdef: 100))),
  #(
    "Omanyte",
    Pokemon(name: "Omanyte", stats: BaseStats(hp: 35, def: 100, sdef: 55)),
  ),
  #(
    "Krabby",
    Pokemon(name: "Krabby", stats: BaseStats(hp: 30, def: 90, sdef: 25)),
  ),
  #(
    "Zapdos",
    Pokemon(name: "Zapdos", stats: BaseStats(hp: 90, def: 85, sdef: 90)),
  ),
  #(
    "Rattata",
    Pokemon(name: "Rattata", stats: BaseStats(hp: 30, def: 35, sdef: 35)),
  ),
  #(
    "Metagross",
    Pokemon(name: "Metagross", stats: BaseStats(hp: 80, def: 130, sdef: 90)),
  ),
  #(
    "Loudred",
    Pokemon(name: "Loudred", stats: BaseStats(hp: 84, def: 43, sdef: 43)),
  ),
  #(
    "Pelipper",
    Pokemon(name: "Pelipper", stats: BaseStats(hp: 60, def: 100, sdef: 70)),
  ),
  #(
    "Ho-Oh",
    Pokemon(name: "Ho-Oh", stats: BaseStats(hp: 106, def: 90, sdef: 154)),
  ),
  #(
    "Spinda",
    Pokemon(name: "Spinda", stats: BaseStats(hp: 60, def: 60, sdef: 60)),
  ),
  #(
    "Mawile",
    Pokemon(name: "Mawile", stats: BaseStats(hp: 50, def: 85, sdef: 55)),
  ),
  #(
    "Ariados",
    Pokemon(name: "Ariados", stats: BaseStats(hp: 70, def: 70, sdef: 70)),
  ),
]
