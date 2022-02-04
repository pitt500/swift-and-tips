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
    @State private var lastScale = 1.0
    private let minScale = 1.0
    private let maxScale = 5.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { state in
                let delta = state / lastScale
                lastScale = state
                scale *= delta
                print("delta: \(delta)")
            }
            .onEnded { state in
                print("onEnded: \(scale)")
                withAnimation {
                    validateScaleLimits()
                }
                lastScale = 1.0
            }
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .gesture(magnification)
    }
    
    func getMinimumScaleAllowed() -> Double {
        return max(scale, minScale)
    }
    
    func getMaximumScaleAllowed() -> Double {
        return min(scale, maxScale)
    }
    
    func validateScaleLimits() {
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(image: Image("1"))
    }
}
