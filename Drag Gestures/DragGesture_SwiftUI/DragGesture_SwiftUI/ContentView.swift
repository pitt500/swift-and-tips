//
//  ContentView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var location = CGPoint(x: 50, y: 50)
    @GestureState private var startLocation: CGPoint?
    @State private var isInside = false

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height

                self.location = newLocation
            }
            .onEnded { value in
                if isInside == false {
                    location = CGPoint(x: 50, y: 50)
                }
            }
            .updating(self.$startLocation) { value, startLocation, transaction in
                startLocation = startLocation ?? location
            }
    }

    var body: some View {
        ZStack {
            VStack {
                Color.white
                GeometryReader { proxy in
                    ZStack {
                        Color.green

                        if isInside(
                            frame: proxy.frame(in: .global),
                            position: location
                        ) {
                            Color.red.opacity(0.5)
                                .frame(
                                    width: proxy.size.width,
                                    height: proxy.size.height
                                )
                        }


                    }

                }
            }
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(drag)
        }
    }

    func isInside(frame: CGRect, position: CGPoint) -> Bool {
        let rangeX = frame.minX...frame.maxX
        let rangeY = frame.minY...frame.maxY
        isInside = rangeX.contains(location.x) && rangeY.contains(location.y)

        return isInside
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
