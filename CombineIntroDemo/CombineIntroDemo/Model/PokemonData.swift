//
//  PokemonData.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    var prefix: String?
    let name: String
    let url: String

    private enum PokemonKeys: String, CodingKey {
        case name
        case url
    }
}

extension Pokemon {
    static let sample: [Self] = [
        .init(prefix: "1", name: "bulbasaur", url: ""),
        .init(prefix: "2", name: "ivysaur", url: ""),
        .init(prefix: "3", name: "venusaur", url: ""),
    ]
}

