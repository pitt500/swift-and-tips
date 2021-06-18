//
//  ContentView.swift
//  MarkdownEditor_SwiftUI
//
//  Created by Pedro Rojas on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "hello \n world"

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        HStack {
            TextEditor(text: $text)
                .disableAutocorrection(true)
                .font(
                    .custom(
                        "Arial",
                        size: 25,
                        relativeTo: .body
                    )
                )
                .background(.blue)
                .foregroundColor(.white)
            ScrollView {
                VStack {
                    Text(attributedText)
                        .lineLimit(nil)
                        .font(
                            .custom(
                                "Arial",
                                size: 25,
                                relativeTo: .body
                            )
                        )
                        .background(.green)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                }.frame(maxWidth: .infinity)
            }


        }
        .padding()
    }

    var attributedText: AttributedString {

        let text = text.replacingOccurrences(of: "\n", with: "\\\n")

        guard let attributedText = try? AttributedString(markdown: text)
        else {
            return AttributedString("Error Parsing text")
        }

        return attributedText
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


struct LongText: View {

    /* Indicates whether the user want to see all the text or not. */
    @State private var expanded: Bool = true

    /* Indicates whether the text has been truncated in its display. */
    @State private var truncated: Bool = false

    private var text: AttributedString

    var lineLimit = 3

    init(_ text: AttributedString) {
        self.text = text
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Render the real text (which might or might not be limited)
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)

                .background(

                    // Render the limited text and measure its size
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { displayedGeometry in

                            // Create a ZStack with unbounded height to allow the inner Text as much
                            // height as it likes, but no extra width.
                            ZStack {

                                // Render the text without restrictions and measure its size
                                Text(self.text)
                                    .background(GeometryReader { fullGeometry in

                                        // And compare the two
                                        Color.clear.onAppear {
                                            self.truncated = fullGeometry.size.height > displayedGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden() // Hide the background
            )

            if truncated { toggleButton }
        }
    }

    var toggleButton: some View {
        Button(action: { self.expanded.toggle() }) {
            Text(self.expanded ? "Show less" : "Show more")
                .font(.caption)
        }
    }
}
