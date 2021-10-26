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
}
