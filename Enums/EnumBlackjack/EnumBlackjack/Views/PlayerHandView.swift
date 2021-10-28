//
//  CardHand.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct PlayerHandView: View {
    let hand: [BlackJackCard]
    let isHidden: Bool

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            ForEach(0..<hand.count, id: \.self) { index in
                if isHidden {
                    HiddenCardView()
                        .frame(width: 150, height: 250)
                        .offset(x: CGFloat(index*60) - 80, y: 0)
                        .scaleEffect(0.7)
                } else {
                    CardView(card: hand[index])
                        .frame(width: 150, height: 250)
                        .offset(x: CGFloat(index*60) - 80, y: 0)
                        .scaleEffect(0.7)
                }


            }
        }

    }
}

struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Rectangle().fill(.red)
                .frame(height: 60)
            PlayerHandView(hand: Array(BlackJackCard.sample.prefix(upTo: 4)), isHidden: true)
                .rotationEffect(.degrees(180))
            Divider()
            PlayerHandView(hand: Array(BlackJackCard.sample.prefix(upTo: 4)), isHidden: false)
            Rectangle().fill(.red)
                .frame(height: 60)
        }
    }
}
