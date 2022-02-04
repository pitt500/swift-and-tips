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
                adjustScale(from: state)
            }
            .onEnded { state in
                print("onEnded: \(scale)")
                withAnimation {
                    validateScaleLimits()
                }
                lastScale = 1.0
            }
            .simultaneously(
                with: DragGesture()
                    .onChanged { state in
                        currentOffset = CGSize(
                            width: state.translation.width + newOffset.width,
                            height: state.translation.height + newOffset.height
                        )
                    }
                    .onEnded { state in
                        withAnimation {
                            if scale <= 1.0 {
                                currentOffset = .zero
                                newOffset = .zero
                            } else {
                                currentOffset = CGSize(
                                    width: state.translation.width + newOffset.width,
                                    height: state.translation.height + newOffset.height
                                )
                                newOffset = currentOffset
                            }
                        }
                    }
            )
    }
    
    @State private var currentOffset = CGSize.zero
    @State private var newOffset = CGSize.zero
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .offset(x: currentOffset.width, y: currentOffset.height)
            .gesture(magnification)
    }
    
    func adjustScale(from state: MagnificationGesture.Value) {
        let delta = state / lastScale
        lastScale = state
        scale *= delta
        print("delta: \(delta)")
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
