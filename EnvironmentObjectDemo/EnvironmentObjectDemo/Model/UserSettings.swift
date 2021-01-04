//
//  UserSettings.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import Combine

class UserSettings: ObservableObject {
    let username: String
    var cart: [Food] = []
    
    init(username: String) {
        self.username = username
    }
}
