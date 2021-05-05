//
//  CombineIntroDemoApp.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import SwiftUI

@main
struct CombineIntroDemoApp: App {
    @StateObject private var loader = PokemonLoader()

    var body: some Scene {
        WindowGroup {
            PokemonList(pokemonLoader: loader)
        }
    }
}
