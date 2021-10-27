//
//  BlackJackViewModel.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import Combine

class BlackJackViewModel: ObservableObject {
    @Published var playerHand: [BlackJackCard] = []
    @Published var cpuHand: [BlackJackCard] = []
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
        case .didPressPlay:
            break
        case .didPressPast:
            break
        }
    }
}
