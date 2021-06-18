//
//  ContentView.swift
//  MarkdownEditor_SwiftUI
//
//  Created by Pedro Rojas on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "hello"

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        HStack {
            TextEditor(text: $text)
                .font(
                    .custom(
                        "SF Mono",
                        size: 20,
                        relativeTo: .body
                    )
                )
                .background(.blue)
                .foregroundColor(.white)
            Text(text)
                .background(.green)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
        }
        .padding()
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
