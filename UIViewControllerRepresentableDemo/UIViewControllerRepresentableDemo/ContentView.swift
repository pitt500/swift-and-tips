//
//  ContentView.swift
//  UIViewControllerRepresentableDemo
//
//  Created by Pedro Rojas on 26/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var documentUrl = ""
    @State private var isPickerPresented = false

    var body: some View {
        Button(
            action: { isPickerPresented.toggle() },
            label: {
                Text("Button")
            }
        )
        .frame(width: 100, height: 60)
        .sheet(isPresented: $isPickerPresented) {
            DocumentPicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
