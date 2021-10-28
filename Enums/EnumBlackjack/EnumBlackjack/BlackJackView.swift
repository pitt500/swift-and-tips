//
//  ContentView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct BlackJackView: View {
    @StateObject private var viewModel = BlackJackViewModel()
    private let cornerRadius: CGFloat = 10

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                Text("CPU")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                PlayerHandView(hand: viewModel.cpuHand)
                    .padding(-20)
                Divider()
                VStack {
                    PlayerHandView(hand: viewModel.playerHand)
                        .padding(-20)

                    Text("You")
                        .font(.system(size: 30))
                        .foregroundColor(.white)

                }

                HStack {
                    ChipView(
                        title: "Hit",
                        color: viewModel.hitColor,
                        action: {
                            viewModel.send(action: .didPressHit)
                        }
                    )
                    .disabled(viewModel.disableHit)
                    .opacity(viewModel.hitOpacity)

                    ChipView(
                        title: "Play",
                        color: .red,
                        action: {
                            viewModel.send(action: .didPressPlay)
                        }
                    )

                    ChipView(
                        title: "Past",
                        color: .black,
                        action: {
                            viewModel.send(action: .didPressPast)
                        }
                    )
                }
                .padding(.bottom, 30)
            }

        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Game Over"),
                message: Text(viewModel.resultMessage),
                dismissButton: .default(
                    Text("Ok"),
                    action: { viewModel.send(action: .restartGame) }
                )
            )
        }
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}
