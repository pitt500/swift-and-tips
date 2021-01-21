//
//  AwesomeWidgetView.swift
//  AwesomeQuoteWidgetExtension
//
//  Created by Pedro Rojas on 1/21/21.
//

import WidgetKit
import SwiftUI

struct AwesomeWidgetView : View {
    var entry: QuoteProvider.Entry
    
    var body: some View {
        Link(destination: entry.quote.url) {
            QuoteCell(quote: entry.quote)
        }
        //For small family
        //.widgetURL(entry.quote.url)
    }
}
