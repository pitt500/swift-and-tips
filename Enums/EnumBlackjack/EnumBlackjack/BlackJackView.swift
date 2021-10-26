//
//  ContentView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct BlackJackView: View {
    @StateObject private var viewModel = BlackJackViewModel()

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                Text("CPU")
                Spacer()
                Divider()
                Spacer()
                ZStack {
                    CardView(card: BlackJackCard(suit: .heart, number: .three))
                    CardView(card: BlackJackCard(suit: .heart, number: .three))
                        .offset(x: 80)

                    CardView(card: BlackJackCard(suit: .heart, number: .ten))
                        .offset(x: 160)
                    CardView(card: BlackJackCard(suit: .heart, number: .three))
                        .offset(x: 240)
                }
                .scaleEffect(0.5)
                Spacer()
                Text("Player")
            }
            .font(.system(size: 24))
            .foregroundColor(.white)
        }


    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}
