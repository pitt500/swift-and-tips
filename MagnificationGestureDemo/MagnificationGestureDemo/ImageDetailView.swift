//
//  ImageDetailView.swift
//  MagnificationGestureDemo
//
//  Created by Pedro Rojas on 04/02/22.
//

import SwiftUI

struct ImageDetailView: View {
    let image: Image
    @State private var scale = 1.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { delta in
                scale *= delta
                print("onChanged: \(scale)")
            }
            .onEnded { state in
                print("onEnded: \(scale)")
                withAnimation {
                    scale = max(scale, 1.0)
                }
            }
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .gesture(magnification)
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(image: Image("1"))
    }
}
