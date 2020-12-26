//
//  User.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import Combine

class User: ObservableObject {
    @Published var name: String = "Pitt"
    @Published var itemCounter: Int = 0
}
