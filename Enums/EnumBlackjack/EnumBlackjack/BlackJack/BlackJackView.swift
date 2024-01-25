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
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                PlayerHandView(
                    hand: viewModel.cpuHand,
                    isHidden: !viewModel.showResult
                )
                    .padding(-20)
                VStack {
                    PlayerHandView(
                        hand: viewModel.playerHand,
                        isHidden: false
                    )
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
                    .alert(isPresented: $viewModel.showResult) {
                        Alert(
                            title: Text("Game Over"),
                            message: Text(viewModel.resultMessage),
                            dismissButton: .default(
                                Text("Ok"),
                                action: { viewModel.send(action: .restartGame) }
                            )
                        )
                    }

                    ChipView(
                        title: "Past",
                        color: .black,
                        action: {
                            viewModel.send(action: .didPressPast)
                        }
                    )
                    .alert(isPresented: $viewModel.showPast) {
                        Alert(
                            title: Text("Previous game"),
                            message: Text(viewModel.previousMessage),
                            dismissButton: .default(
                                Text("Ok")
                            )
                        )
                    }
                }
                .padding(.bottom, 30)
            }

        }
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}
