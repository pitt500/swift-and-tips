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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(1...28, id: \.self) { index in
                        NavigationLink {
                            Text("asd")
                        } label: {
                            Image("\(index)")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .border(.white, width: 5)
                        }
                    }
                }
            }
            .navigationTitle("Soccer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
