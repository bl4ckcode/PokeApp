# PokeApp
Pokemon App Challenge

*What has been used:*

- MVVM
- SwiftUI
- Combine
- URLSession

No third libraries has been used, only Swift frameworks.

![Main Screen](https://i.imgur.com/DM0ZoKN.png?raw=true)

![Pokemon Revealed Screen](https://i.imgur.com/MtrDYJu.png?raw=true)

*Optmizations*:

- ScrollView of latest layout screen (pokemon revealed) could be animated plus show stats and possible evolves of revealed pokemon.
- I created separated components in the PokemonView and PokemonInfoView, those could be in separated files and have parameterized images and texts, to improve reuse.
- Search bottom could have been included in the first screen too as the app structure is prepared for it (change pokemon name in pokeapiurl, e.g ditto, on PokemonViewModel)  
