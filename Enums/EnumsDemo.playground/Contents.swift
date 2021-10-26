import UIKit

// MARK: - Horrible idea!
//let club = 1
//let diamond = 2
//let spade = 3
//let heart = 4
//
//let cardType = 5

// MARK: - RawValue, CaseIterable and computer properties
enum CardSuit: String, CaseIterable, CustomStringConvertible {
    case club = "♣️"
    case diamond = "♦️"
    case heart = "❤️"
    case spade = "♠️"

    var description: String {
        return self.rawValue
    }
}

enum CardNumber: CaseIterable {
    case ace
    case one, two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    var value: Int {
        switch self {
        case .ace:
            return 0
        case .jack, .queen, .king, .ten:
            return 10
        case .one:
            return 1
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
}

struct BlackJackCard {
    let suit: CardSuit
    let number: CardNumber
}

func makeDeck() -> [BlackJackCard] {
    var deck: [BlackJackCard] = []

    for suit in CardSuit.allCases {
        for number in CardNumber.allCases {
            deck.append(.init(suit: suit, number: number))
        }
    }

    return deck
}

var deck = makeDeck()
deck.shuffle()

var cpuHand: [BlackJackCard] = []
cpuHand.append(deck.removeLast())
cpuHand.append(deck.removeLast())

var playerHand: [BlackJackCard] = []
playerHand.append(deck.removeLast())
playerHand.append(deck.removeLast())


// MARK: - Associated values
enum Result {
    case player(score: Int)
    case cpu(score: Int)
    case tie
    //recursive value
    indirect case previous(Result)
}

func getRightAceValue(currentScore: Int, numAces: Int) -> Int {
    let delta = 21 - currentScore

    let elevenAce =  11 + (numAces - 1)
    if elevenAce <= delta {
        return elevenAce
    }

    return numAces
}

func getScore(hand: [BlackJackCard]) -> Int {
    var score = 0
    var numAces = 0

    for card in hand {
        if card.number == .ace {
            numAces += 1
        } else {
            score += card.number.value
        }
    }

    if numAces > 0 {
        score += getRightAceValue(
            currentScore: score,
            numAces: numAces
        )
    }

    hand.forEach {
        print($0.suit, $0.number)
    }

    return score
}

func getResult() -> Result {
    let playerScore = getScore(hand: playerHand)
    print("Player: ", playerScore)

    print("----")
    let cpuScore = getScore(hand: cpuHand)
    print("CPU: ", cpuScore)

    if playerScore > cpuScore && playerScore <= 21 {
        return .player(score: playerScore)
    } else if cpuScore > playerScore {
        return .cpu(score: cpuScore)
    }

    return .tie
}


let result = getResult()
let previousResult = Result.previous(result)

print("----")
switch result {
case .player(let score):
    print("Player won!, Score: \(score)")
case .cpu(let score):
    print("CPU won!, Score: \(score)")
case .tie:
    print("This was a Tie :/")
default:
    break
}

//Indirect enum
if case Result.previous(let result) = previousResult {
    print("Previous Result: \(result)")
}



