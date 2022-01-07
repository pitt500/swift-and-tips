//
//  BabyToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 06/01/22.
//

import SwiftUI

struct BabyToyView: View {
    private let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY * 1.5
    )
    private let greenViewPosition = CGPoint(x: 0, y: UIScreen.main.bounds.midY)
    @State private var currentPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY * 1.5
    )
    @State private var isColliding = false

    private let redPosition: CGPoint = CGPoint(
        x: UIScreen.main.bounds.midX/3,
        y: UIScreen.main.bounds.midY/2
    )

    @State private var isRedColliding = false

    private let greenPosition: CGPoint = CGPoint(
        x: (UIScreen.main.bounds.midX/3),
        y: 60
    )

    private let bluePosition: CGPoint = CGPoint(
        x: (UIScreen.main.bounds.midX/3),
        y: UIScreen.main.bounds.midY/2
    )

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                currentPosition = value.location
                checkCollision()
            }
            .onEnded { value in
                if isColliding == false {
                    withAnimation {
                        currentPosition = initialPosition
                        checkCollision()
                    }
                }
            }

    }

    var body: some View {

        ZStack {
            Color.white.ignoresSafeArea()
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(currentPosition)
                .gesture(drag)
                .zIndex(4)
            HStack {
                ToyView(
                    color: .red,
                    position: redPosition,
                    isColliding: isRedColliding
                )
                Circle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .position(greenPosition)

                Circle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .position(bluePosition)
            }
        }
    }

    func checkCollision() {

        print("Current: \(currentPosition)")
        print("Red: \(redPosition)")
        print("-------")

        let delta: CGFloat = 70

        isRedColliding = abs(currentPosition.y - redPosition.y) < delta && abs(currentPosition.x - redPosition.x) < delta

    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
