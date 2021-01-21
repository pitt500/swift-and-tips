//
//  QuoteProvider.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/21/21.
//

import WidgetKit

struct QuoteProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> QuoteEntry {
        QuoteEntry(
            date: Date(),
            quote: Quote.sample[0],
            configuration: ConfigurationIntent()
        )
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (QuoteEntry) -> ()) {
        let entry = QuoteEntry(
            date: Date(),
            quote: Quote.sample[0],
            configuration: configuration
        )
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<QuoteEntry>) -> ()) {
        var entries: [QuoteEntry] = []

        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .second, value: 5, to: currentDate)!
        let randomIndex = Int.random(in: 0..<Quote.sample.count)
        let entry = QuoteEntry(
            date: entryDate,
            quote: Quote.sample[randomIndex],
            configuration: configuration
        )
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
