//
//  ContentView.swift
//  Demo_SwiftUI_3.0
//
//  Created by Pedro Rojas on 19/06/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loader = PokemonLoader()

    var body: some View {
        NavigationView {
            List {
                LazyVStack {
                    ForEach(loader.pokemonData) { pokemon in
                        AsyncImage(url: pokemon.url, scale: 1.0) { phase in
                            if let image = phase.image {

                                HStack {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120)
                                        .padding(.trailing, 10)
                                    VStack(alignment: .leading) {
                                        Text("**\(pokemon.name.capitalized)**")
                                            .font(.system(size: 24))
                                        Text("*#\(pokemon.id)*")
                                            .font(.system(size: 18))
                                            .foregroundColor(.gray)

                                        // Markdown links only work with string literals.
                                        Text("See [More](https://pokemondb.net/pokedex/national)")
                                        // You cannot use string interpolation ...
//                                        Text("See [More](https://pokemondb.net/pokedex/\(pokemon.name))")
                                    }
                                    Spacer()
                                }
                                .frame(height: 130)
                            } else if phase.error != nil {
                                ErrorView(error: phase.error!)
                            } else {
                                Text("Loading")
                            }
                        }

                        .frame(maxWidth: .infinity)
                        .padding()
                    }


                }
            }
            .navigationTitle("Hello")
            .task {
                loader.load()
            }
            .refreshable {
                loader.load()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ErrorView: View {
    let error: Error

    var body: some View {
        print(error)
        return Text("Error")
    }
}
