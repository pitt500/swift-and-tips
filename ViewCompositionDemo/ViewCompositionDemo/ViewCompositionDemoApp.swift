//
//  ViewCompositionDemoApp.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import SwiftUI

@main
struct ViewCompositionDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: .init(
                    media: Media(
                        name: "Bohemian Rhapsody",
                        artist: "Queen",
                        duration: 330000,
                        imageName: "queen",
                        color: .pink
                    )
                )
            )
        }
    }
}
