import SwiftUI

struct PokemonDescriptionView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading) {
            Text("**\(pokemon.name.capitalized)**")
                .font(.system(size: 24))
            Text("*#\(pokemon.id)*")
                .font(.system(size: 18))
                .foregroundColor(.gray)

            // Markdown links only work with string literals.
            Text("See [More](https://pokemondb.net/pokedex/national)")
            // You cannot use string interpolation ...
            //Text("See [More](https://pokemondb.net/pokedex/\(pokemon.name))")
        }
    }
}

struct PokemonDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDescriptionView(pokemon: Pokemon.sample)
    }
}
