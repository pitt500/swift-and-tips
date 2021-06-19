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
                                    PokemonDescriptionView(pokemon: pokemon)
                                    Spacer()
                                }
                                .frame(height: 130)
                            } else if phase.error != nil {
                                ErrorView(error: phase.error!)
                            } else {
                                ProgressView()
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
