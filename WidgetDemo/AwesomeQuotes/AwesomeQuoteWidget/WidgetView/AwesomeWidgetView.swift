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
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemLarge:
            Link(destination: entry.quote.url) {
                QuoteDetail(quote: entry.quote)
            }
        default:
            Link(destination: entry.quote.url) {
                QuoteCell(quote: entry.quote)
            }
        }
        
        //For small family
        //.widgetURL(entry.quote.url)
    }
}
