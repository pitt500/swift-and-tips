//
//  ContentView.swift
//  PropertyWrappersDemo
//
//  Created by Pedro Rojas on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    @ReinventedState var text = ""

    var body: some View {
        VStack {
            Text(text)
            TextField("hello", text: $text)
                .disableAutocorrection(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@propertyWrapper
struct ReinventedState: DynamicProperty {
    @State private var value: String

    init(wrappedValue: String) {
        self._value = State(wrappedValue: wrappedValue)
    }

    var wrappedValue: String {
        get { value }
        nonmutating set {
            value = newValue
                .uppercased()
        }
    }

    var projectedValue: Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}
