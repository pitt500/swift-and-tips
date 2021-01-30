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
            BadView(
                viewModel: .init(
                    media: Media.demo
                )
            )
        }
    }
}
