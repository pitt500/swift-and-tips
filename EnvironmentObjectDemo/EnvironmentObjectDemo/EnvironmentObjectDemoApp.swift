//
//  EnvironmentObjectDemoApp.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

@main
struct EnvironmentObjectDemoApp: App {
    @StateObject private var userSettings = UserSettings(username: "Pitt")
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
