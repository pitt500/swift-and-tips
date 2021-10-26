//
//  CardView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct CardView: View {
    let card: BlackJackCard

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
            GeometryReader {
                drawCard(proxy: $0)
                    .frame(
                        width: $0.size.width,
                        height: $0.size.height
                    )
            }
            .padding(20)
        }
    }

    @ViewBuilder func drawCard(proxy: GeometryProxy) -> some View {
        switch card.number {
        case .one:
            Text(card.suit.rawValue)
                .font(.system(size: 90))
        case .two:
            VStack {
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
            }
            .font(.system(size: 90))
        case .three:
            VStack {
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
            }
            .font(.system(size: 90))
        case .four:
            VStack {
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .five:
            VStack {
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .six:
            VStack {
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .seven:
            VStack {
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .eight:
            VStack {
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .nine:
            HStack {
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                Text(card.suit.rawValue)
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .ten:
            HStack {
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                VStack {
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                }
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
            }
            .font(.system(size: 90))
        case .jack:
            VStack {
                Spacer()
                Image("jack_club")
                    .resizable()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height*0.8)
                    .scaleEffect(1.3)
                Spacer()
            }
        case .queen:
            VStack {
                Spacer()
                Image("queen_club")
                    .resizable()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height*0.8)
                    .scaleEffect(1.3)
                Spacer()
            }
        case .king:
            VStack {
                Spacer()
                Image("king_club")
                    .resizable()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height*0.8)
                    .scaleEffect(1.3)
                Spacer()
            }
        case .ace:
            VStack {
                Spacer()
                Text(card.suit.rawValue)
                    .font(.system(size: 250))
                Spacer()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            CardView(
                card: BlackJackCard(
                    suit: .heart,
                    number: .ace
                )
            )
                .padding()
        }
    }
}
