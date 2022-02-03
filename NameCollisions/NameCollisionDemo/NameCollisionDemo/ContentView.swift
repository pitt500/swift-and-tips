//
//  ContentView.swift
//  NameCollisionDemo
//
//  Created by Pedro Rojas on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    let inThePark = WalkInThePark()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                inThePark.enjoyTheDay()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
