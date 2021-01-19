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
                    NavigationLinkNoArrow (
                        destination: QuoteDetail(quote: quote),
                        content: QuoteCell(quote: quote)
                    )
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Awesome Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
