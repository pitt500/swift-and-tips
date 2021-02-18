//
//  ContentView.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 15/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    var body: some View {
//        HeartButtonComponent(
//            action: { print("hello") }
//        )
//        .frame(width: 150, height: 50)
        VStack(alignment: .center) {
            PinCodeField(text: $text)
                .fixedSize(horizontal: false, vertical: true)
                .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
