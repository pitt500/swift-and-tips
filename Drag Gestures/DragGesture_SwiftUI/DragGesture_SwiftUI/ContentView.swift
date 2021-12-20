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

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height

                self.location = newLocation
            }
            .updating(self.$startLocation) { value, startLocation, transaction in
                startLocation = startLocation ?? location
            }
    }

    var body: some View {
        ZStack {
            VStack {
                Color.white
                Color.green
            }
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(drag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
