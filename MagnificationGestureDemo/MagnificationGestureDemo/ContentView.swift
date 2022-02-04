//
//  ContentView.swift
//  MagnificationGestureDemo
//
//  Created by Pedro Rojas on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(1...20, id: \.self) {
                    Image("\($0)")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .border(.white, width: 5)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
