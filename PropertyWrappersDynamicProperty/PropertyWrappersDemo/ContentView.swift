//
//  ContentView.swift
//  PropertyWrappersDemo
//
//  Created by Pedro Rojas on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    @StringState(format: .capitalized) var text = ""

    var body: some View {
        VStack {
            Text(text)
            TextField("hello", text: $text)
                .disableAutocorrection(true)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@propertyWrapper
struct StringState: DynamicProperty {
    @State private var value: String
    private var format: Format

    enum Format {
        case lowercased
        case uppercased
        case capitalized
        case `default`
    }

    init(wrappedValue: String, format: Format) {
        self._value = State(wrappedValue: wrappedValue)
        self.format = format
    }

    var wrappedValue: String {
        get { value }
        nonmutating set {
            value = formattedString(newValue)
        }
    }

    var projectedValue: Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }

    private func formattedString(_ string: String) -> String {
        switch format {
        case .capitalized:
            return string.capitalized
        case .lowercased:
            return string.lowercased()
        case .uppercased:
            return string.uppercased()
        case .default:
            return string
        }
    }
}
