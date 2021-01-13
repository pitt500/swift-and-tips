//
//  CartEnvironmentKey.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/4/21.
//

import SwiftUI

struct CartEnvironmentKey: EnvironmentKey {
    static var defaultValue = UserSettings(username: "Pitt")
}

extension EnvironmentValues {
    var settings: UserSettings {
        get { self[CartEnvironmentKey.self] }
        set { self[CartEnvironmentKey.self] = newValue }
    }
    
    var cart: [Food] {
        get { settings.cart }
        set { settings.cart = newValue }
    }
}
