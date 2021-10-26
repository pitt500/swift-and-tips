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

        let fontSize = proxy.size.width*0.3

        switch card.number {

        case .ace:
            Text(card.suit.rawValue)
                .font(.system(size: proxy.size.width*0.8))
        case .two:
            VStack {
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
            }
            .font(.system(size: fontSize))
        case .three:
            VStack {
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
            }
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
            .font(.system(size: fontSize))
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
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(BlackJackCard.Number.allCases, id: \.self) { number in
            ZStack {
                Color.green
                    .ignoresSafeArea()
                CardView(
                    card: BlackJackCard(
                        suit: .heart,
                        number: number
                    )
                )
                    .padding()
            }
        }
    }
}
