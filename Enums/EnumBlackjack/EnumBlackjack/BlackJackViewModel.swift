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
            if remainingHits == 0 {
                disableHit = true
                hitColor = .gray
                hitOpacity = 0.7
            }
        }
    }
    var deck: [BlackJackCard] = []

    enum Action {
        case didPressHit
        case didPressPlay
        case didPressPast
    }

    init() {
        startGame()
    }

    private func startGame() {
        deck = makeDeck()

        cpuHand.append(deck.removeLast())
        cpuHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
        playerHand.append(deck.removeLast())
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

    func send(action: Action) {
        switch action {
        case .didPressHit:
            playerHand.append(deck.removeLast())
            remainingHits -= 1
        case .didPressPlay:
            break
        case .didPressPast:
            break
        }
    }
}
