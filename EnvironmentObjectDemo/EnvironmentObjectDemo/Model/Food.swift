//
//  Food.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Foundation

struct Food: ItemCart, Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: Double
    var description: String
    var image: String
}

extension Food {
    static let sample: [Food] = [
        Food(name: "Burrito", price: 20.99, description: "Viva Mexico!", image: "burrito"),
        Food(name: "Burger", price: 8.99, description: "Widow maker ☠️", image: "burger"),
        Food(name: "Mediterranean Salad", price: 15.99, description: "Fresh fresh fresh!", image: "salad"),
    ]
}
