//
//  CardView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct CardView: View {

    var body: some View {
        Rectangle()
            .fill(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            CardView()
                .padding()
        }
    }
}
