//
//  AwesomeQuoteWidget.swift
//  AwesomeQuoteWidget
//
//  Created by Pedro Rojas on 1/20/21.
//

import WidgetKit
import SwiftUI

@main
struct AwesomeQuoteWidget: Widget {
    let kind: String = "AwesomeQuoteWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: QuoteProvider()) { entry in
            AwesomeWidgetView(entry: entry)
        }
        .configurationDisplayName("Quote of the day")
        .description("Quotes that change your life!")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct AwesomeQuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AwesomeWidgetView(
                entry: QuoteEntry(
                    date: Date(),
                    quote: Quote.sample[0],
                    configuration: ConfigurationIntent()
                )
            )
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            
            AwesomeWidgetView(
                entry: QuoteEntry(
                    date: Date(),
                    quote: Quote.sample[0],
                    configuration: ConfigurationIntent()
                )
            )
            .redacted(reason: .placeholder)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            
        }
    }
}
