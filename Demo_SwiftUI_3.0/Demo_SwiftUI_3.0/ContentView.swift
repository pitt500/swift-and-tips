//
//  ContentView.swift
//  Demo_SwiftUI_3.0
//
//  Created by Pedro Rojas on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    let url = URL(string: "https://img.pokemondb.net/artwork/large/bulbasaur.jpg")!

    var body: some View {
        AsyncImage(
            url: url,
            content: { $0.resizable() },
            placeholder: { Text("placeholder") }
        )
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
