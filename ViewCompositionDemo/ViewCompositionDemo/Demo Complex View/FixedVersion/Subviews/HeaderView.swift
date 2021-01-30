//
//  HeaderView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
                .font(
                    .system(
                        size: 20,
                        weight: .regular,
                        design: .default
                    )
                )

            Spacer()
            Text(title)
                .foregroundColor(.white)
                .font(
                    .system(
                        size: 15,
                        weight: .bold,
                        design: .default
                    )
                )
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundColor(.white)
                .font(
                    .system(
                        size: 20,
                        weight: .bold,
                        design: .default
                    )
                )

        }
        .frame(minHeight: 0, maxHeight: 100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Queen")
            .background(Color.red)
            .previewLayout(.fixed(width: 350, height: 100))
    }
}
