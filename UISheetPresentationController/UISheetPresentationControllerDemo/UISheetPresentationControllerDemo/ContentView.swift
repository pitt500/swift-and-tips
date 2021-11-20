//
//  ContentView.swift
//  UISheetPresentationControllerDemo
//
//  Created by Pedro Rojas on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BottomSheetView {
            Text("Hi there")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
