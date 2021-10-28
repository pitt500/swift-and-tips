//
//  HiddenCardView.swift
//  EnumBlackjack
//
//  Created by Pedro Rojas on 27/10/21.
//

import SwiftUI

struct HiddenCardView: View {
    var body: some View {
        GeometryReader { parentProxy in
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                Text("❓")
                    .font(.system(size: parentProxy.size.width*0.7))
                .padding()

            }
            .frame(
                width: parentProxy.size.width,
                height: parentProxy.size.height
            )

        }
    }
}

struct HiddenCardView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenCardView()
    }
}
