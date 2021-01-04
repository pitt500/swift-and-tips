//
//  UserSettings.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Combine

class UserSettings: ObservableObject {
    let username: String
    @Published var cart: [Food] = []
    
    init(username: String) {
        self.username = username
    }
}
