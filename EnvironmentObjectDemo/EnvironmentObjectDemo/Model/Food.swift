//
//  Food.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Foundation

struct Food: Identifiable, Hashable {
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
    
    static let beverages: [Food] = [
        Food(name: "Hipster Beer", price: 5.99, description: "From Oktoberfest!", image: "beer"),
        Food(name: "Pure Water", price: 18.99, description: "Just...water", image: "water"),
        Food(name: "Diet Soda", price: 10.99, description: "0 carbs... more or less", image: "diet"),
    ]
    
    static let desserts: [Food] = [
        Food(name: "Apple Pie", price: 5.99, description: "We love ... I mean 🍎!", image: "applepie"),
        Food(name: "Chocolate Cake", price: 18.99, description: "CHOCOLATE!!!!", image: "chocolate"),
        Food(name: "Super Ice Cream", price: 10.99, description: "Avoid it if you're a dragon 🐲", image: "icecream"),
    ]
}
