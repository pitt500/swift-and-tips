//
//  BlackJackEngine.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 28/10/21.
//

import Foundation

struct BlackJackEngine {
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

    func getResult(
        _ playerHand: [BlackJackCard],
        _ cpuHand: [BlackJackCard]
    ) -> Result {
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
