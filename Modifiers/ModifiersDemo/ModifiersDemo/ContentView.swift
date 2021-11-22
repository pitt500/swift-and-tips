//
//  ContentView.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is Swift and Tips!")
                .blueTitle()

            Text("Follow me on @swiftandtips")
                .blueTitle(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func blueTitle(radius: CGFloat = 10) -> some View {
        modifier(BlueTitle(radius: radius))
    }
}
