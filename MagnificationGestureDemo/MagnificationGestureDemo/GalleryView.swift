//
//  GalleryView.swift
//  MagnificationGestureDemo
//
//  Created by Pedro Rojas on 04/02/22.
//

import SwiftUI

struct GalleryView: View {
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let numberOfImages = 28
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(1...numberOfImages, id: \.self) { index in
                        NavigationLink {
                            ImageDetailView(image: Image("\(index)"))
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
        GalleryView()
            .preferredColorScheme(.dark)
    }
}
