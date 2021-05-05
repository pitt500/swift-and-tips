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

