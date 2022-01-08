//
//  ToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 07/01/22.
//

import SwiftUI

struct ToyView: View {
    let id: Int
    let color: Color
    let currentPosition: CGPoint
    @Binding var currentId: Int

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
        let isColliding = frame.contains(currentPosition)
        // This is illegal 🚨
//        if isColliding {
//            currentId = id
//        }

        return isColliding
    }
}

struct ToyView_Previews: PreviewProvider {
    static var previews: some View {
        ToyView(
            id: 1,
            color: .red,
            currentPosition: .zero,
            currentId: .constant(1)
        )
    }
}
