//
//  ContentView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var location = CGPoint(x: 50, y: 50)

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }

    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .position(location)
            .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
