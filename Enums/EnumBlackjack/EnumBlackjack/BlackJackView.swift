//
//  ContentView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 26/10/21.
//

import SwiftUI

struct BlackJackView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                Text("CPU")
                Spacer()
                Divider()
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
