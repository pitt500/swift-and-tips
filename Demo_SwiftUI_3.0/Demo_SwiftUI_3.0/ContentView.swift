//
//  ContentView.swift
//  Demo_SwiftUI_3.0
//
//  Created by Pedro Rojas on 19/06/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loader = PokemonLoader()
    private let imageWidth = 110.0
    private let cellHeight = 130.0

    var body: some View {
        NavigationView {
            List {
                ForEach(loader.pokemonData) { pokemon in
                    AsyncImage(url: pokemon.url, scale: 1.0) { phase in
                        switch phase {

                        case .success(let image):
                            HStack {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: imageWidth)
                                    .padding(.trailing, 10)
                                PokemonDescriptionView(pokemon: pokemon)
                                Spacer()
                            }

                        case .failure(let error):
                            ErrorView(error: error)
                        case .empty:
                            HStack {
                                ProgressView()
                                Spacer()
                            }

                        @unknown default:
                            // AsyncImagePhase is not marked as @frozen.
                            // We need to support new cases in the future.
                            Image(systemName: "questionmark")
                        }
                    }

                    .frame(maxWidth: .infinity)
                    .frame(height: cellHeight)
                    .padding()
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
        return Text("❌ **Error**").font(.system(size: 60))
    }
}
