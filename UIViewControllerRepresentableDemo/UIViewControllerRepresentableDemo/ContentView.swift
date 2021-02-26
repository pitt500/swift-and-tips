//
//  ContentView.swift
//  UIViewControllerRepresentableDemo
//
//  Created by Pedro Rojas on 26/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2

    var body: some View {
        TabView(selection: $selection) {
            Text("First")
                .tabItem {
                    Label("Hello", systemImage: "heart")
                }
                .tag(1)
            Text("Second")
                .tabItem {
                    Label("Bye", systemImage: "star")
                }
                .tag(2)
        }
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
