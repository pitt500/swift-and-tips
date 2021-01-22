//
//  QuoteProvider.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/21/21.
//

import WidgetKit

struct QuoteProvider: TimelineProvider {
    func placeholder(in context: Context) -> QuoteEntry {
        return QuoteEntry(
            date: Date(),
            quote: Quote.sample[0]
        )
    }
    

    func getSnapshot(in context: Context, completion: @escaping (QuoteEntry) -> ()) {
        let entry = QuoteEntry(
            date: Date(),
            quote: Quote.sample[0]
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<QuoteEntry>) -> ()) {
        var entries: [QuoteEntry] = []
        let currentDate = Date()
        
        for _ in 1...4 {
            let randomIndex = Int.random(in: 0..<Quote.sample.count)
            let entryDate = Calendar.current.date(byAdding: .minute, value: 6, to: currentDate)!
            let entry = QuoteEntry(
                date: entryDate,
                quote: Quote.sample[randomIndex]
            )
            entries.append(entry)
        }
        
        

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
