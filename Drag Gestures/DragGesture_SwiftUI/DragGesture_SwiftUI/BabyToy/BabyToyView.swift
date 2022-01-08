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
    @State private var isRedColliding = false
    @State private var isGreenColliding = false
    @State private var isBlueColliding = false

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                currentPosition = value.location
                checkCollision()
            }
            .onEnded { value in
                withAnimation {
                    currentPosition = initialPosition
                    checkCollision()
                }
            }

    }

    var body: some View {

        ZStack {
            Color.white

            HStack {
                ToyView(
                    color: .red,
                    currentPosition: currentPosition
                )
                Spacer()
                    .frame(maxWidth: 80)
                ToyView(
                    color: .green,
                    currentPosition: currentPosition
                )
                Spacer()
                    .frame(maxWidth: 80)
                ToyView(
                    color: .blue,
                    currentPosition: currentPosition
                )
            }
            //.padding(50)

            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(currentPosition)
                .gesture(drag)
                .zIndex(4)


        }
        .ignoresSafeArea()
    }

    func checkCollision() {

//        print("Current: \(currentPosition)")
//        print("Red: \(redPosition)")
//        print("-------")
//
//        let delta: CGFloat = 70
//
//        isRedColliding = abs(currentPosition.y - redPosition.y) < delta && abs(currentPosition.x - redPosition.x) < delta
//
//        isBlueColliding = abs(currentPosition.y - bluePosition.y) < delta && abs(currentPosition.x - bluePosition.x) < delta
//        print("Current: \(currentPosition)")
//        print("Blue: \(bluePosition)")
//        print("-------")
//
//        isGreenColliding = abs(currentPosition.y - greenPosition.y) < delta && abs(currentPosition.x - greenPosition.x) < delta

    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
