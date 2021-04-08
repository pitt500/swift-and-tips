//
//  ContentView.swift
//  OpaqueTypes_SwiftUI
//
//  Created by Pedro Rojas on 07/04/21.
//

import SwiftUI

struct ContentView: View {
    // SwiftUI without opaque types 💥
    // Change the position of any view and the return type will be different!
    var body: VStack<TupleView<(Text, List<Never, ForEach<Range<Int>, Int, Text>>)>> {
        VStack {
            Text("Title!")
            List {
                ForEach(0..<5) { value in
                    Text("\(value)")
                }
            }
        }
    }

    // Error: Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
//    var body: -> View {
//        Text("Hello!")
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
