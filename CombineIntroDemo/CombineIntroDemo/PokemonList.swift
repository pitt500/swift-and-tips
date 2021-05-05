//
//  PokemonList.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import SwiftUI

struct PokemonList: View {
    @ObservedObject var pokemonLoader: PokemonLoader

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(pokemonLoader.pokemonData,
                            id: \.name)
                    {
                        PokemonCell(pokemon: $0)
                            .noSeparators(color: .white)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Pokedex")
                .navigationBarItems(
                    trailing: Button(
                        action: { pokemonLoader.load() },
                        label: { Text("Reload") }
                    )
                )

                if pokemonLoader.isLoading {
                    ActivityIndicator(style: .large, isLoading: true)
                }
            }
        }
        .onAppear {
            pokemonLoader.load()
        }
        .alert(isPresented: $pokemonLoader.error) { 
            Alert(title: Text("Server error, try again later"))
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(pokemonLoader: PokemonLoader())
    }
}
