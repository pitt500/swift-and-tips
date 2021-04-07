//
//  ContentView.swift
//  OpaqueTypes_SwiftUI
//
//  Created by Pedro Rojas on 07/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        makeBody2()
    }

    // Error: Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
//    func makeBody() -> View {
//        Text("Hello!")
//    }

    // SwiftUI without opaque types 💥
    // Change the position of any view and the return type will be different!
    func makeBody() -> VStack<TupleView<(Text, List<Never, ForEach<Range<Int>, Int, Text>>)>> {
        VStack {
            Text("Title!")
            List {
                ForEach(0..<5) { value in
                    Text("\(value)")
                }
            }
        }
    }

    //Type-erasing
    // Avoid this, this will reduce your performance! 💥
    /// Documentation: Whenever the type of view used
    /// with an `AnyView` changes, the old
    /// hierarchy is destroyed and a new hierarchy is
    /// created for the new type.
    /// https://developer.apple.com/documentation/swiftui/anyview
    func makeBody2() -> AnyView {
        AnyView(
            VStack {
                Text("Title!")
                List {
                    ForEach(0..<5) { value in
                        Text("\(value)")
                    }
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
