//
//  User.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Combine

class User: ObservableObject {
    let name: String
    var cart: [ItemCart] = []
    
    init(name: String) {
        self.name = name
    }
}
