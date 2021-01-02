//
//  Beverage.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Foundation

struct Beverage: ItemCart {
    var id: UUID = UUID()
    var name: String
    var price: Double
    var description: String
    var image: String
}
