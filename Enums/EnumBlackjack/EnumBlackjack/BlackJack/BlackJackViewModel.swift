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
    @Published var showResult = false
    @Published var showPast = false

    private(set) var hitColor = Color.black
    private(set) var hitOpacity = 1.0
    private(set) var deck: [BlackJackCard] = []
    private(set) var resultMessage = ""
    private let engine = BlackJackEngine()
    private var previousResult: BlackJackEngine.Result?

    var remainingHits = 2 {
        didSet {
            updateHitButton()
        }
    }

    var previousMessage: String {
        if case .previous(let result) = previousResult {
            return "\(result)"
        }

        return "No results yet"
    }

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
        let result = engine.getResult(playerHand, cpuHand)
        previousResult = .previous(result)

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
    }

    func send(action: Action) {
        switch action {
        case .didPressHit:
            playerHand.append(deck.removeLast())
            remainingHits -= 1
        case .didPressPlay:
            play()
            showResult = true
        case .didPressPast:
            showPast = true
        case .restartGame:
            startGame()
        }
    }
}
