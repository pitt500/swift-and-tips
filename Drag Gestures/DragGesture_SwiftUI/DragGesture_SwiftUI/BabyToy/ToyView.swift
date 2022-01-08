//
//  ToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 07/01/22.
//

import SwiftUI

struct ToyView: View {
    let color: Color
    let currentPosition: CGPoint

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                Circle()
                    .fill(color)
                    .frame(width: 100, height: 100)
                if isColliding(frame: proxy.frame(in: .global)) {
                    Circle()
                        .fill(color)
                        .opacity(0.5)
                        .frame(width: 120, height: 120)
                }
            }
            .position(
                x: proxy.frame(in: .local).midX,
                y: proxy.frame(in: .local).midY
            )
        }
        .frame(width: 120, height: 120)
    }

    func isColliding(frame: CGRect) -> Bool {
        let delta: CGFloat = 70
        return  abs(frame.midY - currentPosition.y) < delta &&
                abs(frame.midX - currentPosition.x) < delta
    }
}

struct ToyView_Previews: PreviewProvider {
    static var previews: some View {
        ToyView(
            color: .red,
            currentPosition: .zero
        )
    }
}
