//
//  ItemCart.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Foundation

protocol ItemCart {
    var id: UUID { get set }
    var name: String { get set }
    var price: Double { get set }
}
