//
//  BlackJackCard.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import Foundation


struct BlackJackCard: Identifiable {
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case club = "♣️"
        case diamond = "♦️"
        case heart = "❤️"
        case spade = "♠️"

        var description: String {
            return self.rawValue
        }

        var name: String {
            switch self {
            case .club:
                return "club"
            case .diamond:
                return "diamond"
            case .heart:
                return "heart"
            case .spade:
                return "spade"
            }
        }
    }

    enum Number: CaseIterable {
        case ace
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        var value: Int {
            switch self {
            case .ace:
                return 1
            case .jack, .queen, .king, .ten:
                return 10
            case .two:
                return 2
            case .three:
                return 3
            case .four:
                return 4
            case .five:
                return 5
            case .six:
                return 6
            case .seven:
                return 7
            case .eight:
                return 8
            case .nine:
                return 9
            }
        }

        var symbol: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(value)"
            }
        }
    }

    let suit: Suit
    let number: Number
    let id = UUID()
}

extension BlackJackCard {
    static let sample = [
        BlackJackCard(suit: .heart, number: .ace),
        BlackJackCard(suit: .diamond, number: .six),
        BlackJackCard(suit: .spade, number: .three),
        BlackJackCard(suit: .club, number: .ten),
    ]
}
