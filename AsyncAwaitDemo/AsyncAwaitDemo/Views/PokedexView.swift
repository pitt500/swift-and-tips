//
//  PokedexView.swift
//  AsyncAwaitDemo
//
//  Created by Pedro Rojas on 26/06/21.
//

import SwiftUI

struct PokedexView: View {
    @StateObject private var loader = PokemonLoader()

    var body: some View {
        NavigationView {
            ZStack {
                PokemonList(loader: loader)
                    .navigationTitle("PokeDex")
                    .task {
                        // Task is the same like onAppear, but works with async tasks.
                        // also it cancels the task when the view disappears.
                        await loader.load()
                    }
                    .refreshable {
                        // Enable Pull to refresh
                        await loader.load()
                    }
                    .alert(isPresented: $loader.error) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please try again later")
                        )
                    }
            }
            
        }

    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
