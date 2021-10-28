//
//  ChipView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 27/10/21.
//

import SwiftUI

struct ChipView: View {

    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .frame(width: 100, height: 100)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
        )
            .background(color)
            .overlay(
                Circle()
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            dash: [10.0]
                        )
                    )
                    .fill(.white)
            )
            .clipShape(Circle())
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ChipView(
                title: "hello",
                color: .red,
                action: {}
            )
        }
    }
}
