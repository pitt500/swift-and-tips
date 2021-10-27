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
                PlayerHandView(hand: viewModel.cpuHand)
                Divider()
                VStack {
                    PlayerHandView(hand: viewModel.playerHand)

                    Text("You")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }

                HStack {
                    Button(
                        action: {
                            viewModel.send(action: .didPressHit)
                        },
                        label: {
                            Text("Hit")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()

                        }
                    )
                    
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        dash: [10.0]
                                    )
                                )
                                .fill(.white)

                        )
                        .background(viewModel.hitColor)
                        .clipped()
                        .cornerRadius(cornerRadius)
                        .padding(10)
                        .disabled(viewModel.disableHit)
                        .opacity(viewModel.hitOpacity)

                    Button(
                        action: {
                            viewModel.send(action: .didPressPlay)
                        },
                        label: {
                            Text("Play")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                    )
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        dash: [10.0]
                                    )
                                )
                                .fill(.white)

                        )
                        .background(.red)
                        .clipped()
                        .cornerRadius(cornerRadius)
                        .padding(10)
                    Button(
                        action: {
                            viewModel.send(action: .didPressPast)
                        },
                        label: {
                            Text("Past")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()

                        }
                    )
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        dash: [10.0]
                                    )
                                )
                                .fill(.white)

                        )
                        .background(.black)
                        .clipped()
                        .cornerRadius(cornerRadius)
                        .padding(10)
                }
                .frame(maxHeight: 60)
            }

        }
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}
