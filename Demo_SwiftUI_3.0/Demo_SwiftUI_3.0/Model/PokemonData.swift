//
//  PokemonData.swift
//  Demo_SwiftUI_3.0
//
//  Created by Pedro Rojas on 19/06/21.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable, Identifiable {
    private static var totalFound = 0

    let id: Int
    let name: String
    var  url: URL {
        URL(string: "https://img.pokemondb.net/artwork/large/\(name).jpg")!
    }

    private enum PokemonKeys: String, CodingKey {
        case name
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        Pokemon.totalFound += 1
        self.id = Pokemon.totalFound
    }
}

extension Pokemon {
    static let sample = Self.init(id: 1, name: "bulbasaur")
}

