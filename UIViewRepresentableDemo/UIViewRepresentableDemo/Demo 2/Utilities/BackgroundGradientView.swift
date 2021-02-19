//
//  BackgroundView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct BackgroundGradientView: View {
    let color: Color

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        color.opacity(0.6),
                        color.opacity(0.3)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView(color: .pink)
    }
}

