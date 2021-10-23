import UIKit

// MARK: - Horrible idea!
//let club = 1
//let diamond = 2
//let spade = 3
//let heart = 4
//
//let cardType = 5

// MARK: - Great approach with enums
enum CardSuit {
    case club
    case diamond
    case heart
    case spade
}


let card = CardSuit.club
