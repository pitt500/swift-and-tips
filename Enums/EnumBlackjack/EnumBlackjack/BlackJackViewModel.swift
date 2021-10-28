//
//  BlackJackViewModel.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import Combine
import SwiftUI

class BlackJackViewModel: ObservableObject {
    @Published private(set) var playerHand: [BlackJackCard] = []
    @Published private(set) var cpuHand: [BlackJackCard] = []
    @Published private(set) var disableHit = false
    private(set) var hitColor = Color.black
    private(set) var hitOpacity = 1.0
    var remainingHits = 2 {
        didSet {
            updateHitButton()
        }
    }
    private(set) var deck: [BlackJackCard] = []
    private(set) var resultMessage = ""
    @Published var showAlert = false

    enum Action {
        case didPressHit
        case didPressPlay
        case didPressPast
        case restartGame
    }

    init() {
        startGame()
    }

    private func startGame() {
        deck = makeDeck()
        deck.shuffle()
        playerHand.removeAll()
        cpuHand.removeAll()
        remainingHits = 2

        cpuHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
    }

    func updateHitButton() {
        disableHit = remainingHits == 0
        hitColor = remainingHits == 0 ? .gray : .black
        hitOpacity = remainingHits == 0 ? 0.7 : 1.0
    }

    private func makeDeck() -> [BlackJackCard] {
        var deck: [BlackJackCard] = []

        for suit in BlackJackCard.Suit.allCases {
            for number in BlackJackCard.Number.allCases {
                deck.append(.init(suit: suit, number: number))
            }
        }

        return deck
    }

    private func play() {
        let result = getResult()
        //let previousResult = Result.previous(result)

        switch result {
        case .player(let score):
            resultMessage = "You won!, Score: \(score)"
        case .cpu(let score):
            resultMessage = "CPU won!, Score: \(score)"
        case .tie:
            resultMessage = "This was a Tie :/"
        default:
            break
        }

        showAlert = true
    }

    func send(action: Action) {
        switch action {
        case .didPressHit:
            playerHand.append(deck.removeLast())
            remainingHits -= 1
        case .didPressPlay:
            play()
        case .didPressPast:
            break
        case .restartGame:
            startGame()
        }
    }
}

extension BlackJackViewModel {
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

        if playerScore == cpuScore {
            return .tie
        }else if playerScore > cpuScore && playerScore <= 21 {
            return .player(score: playerScore)
        }

        return .cpu(score: cpuScore)
    }
}
