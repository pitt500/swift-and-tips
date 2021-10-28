//
//  CardView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct CardView: View {
    let card: BlackJackCard
    let color: Color

    init(card: BlackJackCard) {
        self.card = card

        let isRed = [BlackJackCard.Suit.diamond, .heart]
            .contains(card.suit)
        self.color = isRed ? .red : .black
    }

    var body: some View {
        GeometryReader { parentProxy in
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack{
                    HStack {
                        VStack {
                            Text(card.number.symbol)
                            Text(card.suit.rawValue)
                                .font(.system(size: parentProxy.size.width*0.05))
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        VStack {
                            Text(card.number.symbol)
                            Text(card.suit.rawValue)
                                .font(.system(size: parentProxy.size.width*0.05))
                        }
                        .rotationEffect(.degrees(180))
                    }
                }
                .font(.custom("Courier", size: parentProxy.size.width*0.1))
                .foregroundColor(color)
                .padding()
                GeometryReader {
                    drawCard(proxy: $0)
                        .frame(
                            width: $0.size.width,
                            height: $0.size.height
                        )
                }
                .padding(parentProxy.size.width*0.2)
            }
            .frame(
                width: parentProxy.size.width,
                height: parentProxy.size.height
            )

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
                    .rotationEffect(.degrees(180))
            }
            .font(.system(size: fontSize))
        case .three:
            VStack {
                Text(card.suit.rawValue)
                Spacer()
                Text(card.suit.rawValue)
                    .rotationEffect(.degrees(180))
                Spacer()
                Text(card.suit.rawValue)
                    .rotationEffect(.degrees(180))
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
                .rotationEffect(.degrees(180))
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
                    .rotationEffect(.degrees(180))
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                .rotationEffect(.degrees(180))
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
                .rotationEffect(.degrees(180))
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                .rotationEffect(.degrees(180))
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
                    .rotationEffect(.degrees(180))
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                .rotationEffect(.degrees(180))
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                .rotationEffect(.degrees(180))
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
                .rotationEffect(.degrees(180))
                Spacer()
                Text(card.suit.rawValue)
                    .rotationEffect(.degrees(180))
                Spacer()
                HStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                }
                .rotationEffect(.degrees(180))
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
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                }
                Text(card.suit.rawValue)
                    .rotationEffect(.degrees(180))
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
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
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                }
                VStack {
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                    Spacer()
                }
                VStack {
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Text(card.suit.rawValue)
                        .rotationEffect(.degrees(180))
                }
            }
            .font(.system(size: fontSize*0.85))
            
        case .jack, .queen, .king:
            VStack {
                Spacer()
                Image("\(card.number.symbol)_\(card.suit.name)")
                    .resizable()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height*0.6)
                    .scaleEffect(1.7)
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
                        suit: .spade,
                        number: number
                    )
                )
                    .padding()
            }
        }
    }
}
