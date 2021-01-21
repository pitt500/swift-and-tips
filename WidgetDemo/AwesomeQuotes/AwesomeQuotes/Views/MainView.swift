//
//  ContentView.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var selected: UUID?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Quote.sample) { quote in
                    NavigationLinkNoArrow (
                        destination: QuoteDetail(quote: quote),
                        content: QuoteCell(quote: quote),
                        selected: $selected,
                        tag: quote.id
                    )
                    .listRowInsets(EdgeInsets())
                }
            }
            .onOpenURL { url in
                guard let index = Quote.sample.firstIndex (where: { $0.url == url })
                else { return }
                
                selected = Quote.sample[index].id
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Awesome Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
