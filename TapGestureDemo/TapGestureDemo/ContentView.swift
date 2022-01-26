//
//  ContentView.swift
//  TapGestureDemo
//
//  Created by Pedro Rojas on 26/01/22.
//

import SwiftUI

struct ContentView: View {
    @GestureState var anotherState = false
    @State var isTapped = false
    
    var tap: some Gesture {
        TapGesture(count: 4)
            .onEnded { state in
                // State is an empty tuple (void)
                isTapped.toggle()
            }
            .updating(
                self.$anotherState
            ) { currentState, pastState, transaction in
                // useless, it just report an empty tuple
            }
    }
        
    var body: some View {
        Circle()
            .fill(isTapped ? .red : .blue)
            .frame(width: 200, height: 200)
//            .onTapGesture(count: 4) {
//                isTapped.toggle()
//            }
            .gesture(tap)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
