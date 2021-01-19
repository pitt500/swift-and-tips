//
//  ContentView.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Quote.sample) { quote in
                    QuoteCell(quote: quote)
                        .listRowInsets(EdgeInsets())
                }
            }
            .navigationTitle("Awesome Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
