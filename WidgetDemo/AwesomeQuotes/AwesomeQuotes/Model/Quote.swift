//
//  Quote.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import Foundation

struct Quote: Identifiable {
    let id = UUID().uuidString
    let description: String
    let author: String
    let profession: String
    let randomImageValue = Int.random(in: 1...6)
}

extension Quote {
    static let sample = [
        Quote(
            description: "Keep your face to the sunshine and you cannot see a shadow.",
            author: "Helen Keller",
            profession: "Author"
        ),
        Quote(
            description: "No one is perfect - that’s why pencils have erasers.",
            author: "Wolfgang Riebe",
            profession: "Keynote Speaker-Magician"
        ),
        Quote(
            description: "You always pass failure on the way to success.",
            author: "Mickey Rooney",
            profession: "Actor"
        ),
        Quote(
            description: "You’re off to great places, today is your day. Your mountain is waiting, so get on your way.",
            author: "Dr. Seuss",
            profession: "Author-Poet"
        ),
        Quote(
            description: "It always seems impossible until it is done.",
            author: "Nelson Mandela",
            profession: "Political Leader"
        ),
        Quote(
            description: "You’re braver than you believe, and stronger than you seem, and smarter than you think.",
            author: "A.A. Mine",
            profession: "Author-Poet"
        ),
        Quote(
            description: "Once you replace negative thoughts with positive ones, you’ll start having positive results.",
            author: "Willie Nelson",
            profession: "Musician"
        ),
        Quote(
            description: "The only time you fail is when you fall down and stay down.",
            author: "Stephen Richards",
            profession: "Author"
        ),
        Quote(
            description: "If opportunity doesn’t knock, build a door.",
            author: "Milton Berle",
            profession: "Comedian"
        ),
        Quote(
            description: "Success is the sum of small efforts repeated day in and day out.",
            author: "Robert Collier",
            profession: "Author"
        ),
        Quote(
            description: "The good life is a process, not a state of being. It is a direction, not a destination.",
            author: "Carl Rogers",
            profession: "Psychologist"
        ),
        Quote(
            description: "Live life to the fullest and focus on the positive.",
            author: "Matt Cameron",
            profession: "Musician"
        ),
        Quote(
            description: "So long King Bowser!!",
            author: "Mario Bros.",
            profession: "Plumber"
        ),
    ]
}
