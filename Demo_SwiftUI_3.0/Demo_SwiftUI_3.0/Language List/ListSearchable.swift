//
//  ListSearchable.swift
//  Demo_SwiftUI_3.0
//
//  Created by Pedro Rojas on 16/06/21.
//

import SwiftUI

struct LanguageList: View {
    @State private var text = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<50) {
                    Text("\($0)")

                }
                //.listRowSeparatorTint(.red)
                .listRowSeparator(.hidden)
            }

            .navigationTitle("Demo")

            //Text("No data")
        }
        .searchable(text: $text)
        .refreshable(action: { print("hello") })
        .task {
            print("Task executed")
        }
        .onAppear {
            print("onAppear")
        }
    }
}

struct LanguageList_Previews: PreviewProvider {
    static var previews: some View {
        LanguageList()
    }
}
