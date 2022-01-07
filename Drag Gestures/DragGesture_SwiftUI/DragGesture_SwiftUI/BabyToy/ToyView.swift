//
//  ToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 07/01/22.
//

import SwiftUI

struct ToyView: View {
    let position: CGPoint
    let isColliding: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(.green)
                .frame(width: 100, height: 100)
                .position(position)
            if isColliding {
                Circle()
                    .fill(Color.green)
                    .opacity(0.5)
                    .frame(width: 120, height: 120)
                    .position(position)
            }
        }
    }
}

struct ToyView_Previews: PreviewProvider {
    static var previews: some View {
        ToyView(
            position: CGPoint(
                x: 100,
                y: 50
            ),
            isColliding: true
        )
    }
}
