//
//  Quote.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import Foundation

struct Quote: Identifiable {
    let id = UUID()
    let description: String
    let author: String
    let profession: String
    let imageNumber: Int
    let url: URL
}

extension Quote {
    static var sample = [
        Quote(
            description: "No one is perfect - that’s why pencils have erasers.",
            author: "Wolfgang Riebe",
            profession: "Keynote Speaker-Magician",
            imageNumber: 1,
            url: URL(string: "awesomeQuotes:///quote2")!
        ),
        Quote(
            description: "You always pass failure on the way to success.",
            author: "Mickey Rooney",
            profession: "Actor",
            imageNumber: 2,
            url: URL(string: "awesomeQuotes:///quote3")!
        ),
        Quote(
            description: "It always seems impossible until it is done.",
            author: "Nelson Mandela",
            profession: "Political Leader",
            imageNumber: 3,
            url: URL(string: "awesomeQuotes:///quote5")!
        ),
        Quote(
            description: "If opportunity doesn’t knock, build a door.",
            author: "Milton Berle",
            profession: "Comedian",
            imageNumber: 4,
            url: URL(string: "awesomeQuotes:///quote9")!
        ),
        Quote(
            description: "Success is the sum of small efforts repeated day in and day out.",
            author: "Robert Collier",
            profession: "Author",
            imageNumber: 5,
            url: URL(string: "awesomeQuotes:///quote10")!
        ),
    ]
}
