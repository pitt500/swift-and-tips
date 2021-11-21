//
//  ContentView.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
