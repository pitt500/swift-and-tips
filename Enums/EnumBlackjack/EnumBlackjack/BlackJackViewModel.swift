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

    func startGame() {
        deck = makeDeck()
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
}
