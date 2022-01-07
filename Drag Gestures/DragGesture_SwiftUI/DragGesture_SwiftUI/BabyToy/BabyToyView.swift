//
//  BabyToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 06/01/22.
//

import SwiftUI

struct BabyToyView: View {
    private let initialPosition = CGPoint(x: 60, y: 50)
    private let greenViewPosition = CGPoint(x: 0, y: UIScreen.main.bounds.midY)
    @State private var currentPosition = CGPoint(x: 60, y: 50)
    @State private var isColliding = false

    private let redPosition: CGPoint = CGPoint(
        x: UIScreen.main.bounds.midX/3,
        y: UIScreen.main.bounds.midY/2
    )

    private let greenPosition: CGPoint = CGPoint(
        x: (UIScreen.main.bounds.midX/3),
        y: 0
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
            VStack {
                Color.white

                GeometryReader { proxy in
                    HStack {
                        Circle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                            .position(redPosition)
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
                .ignoresSafeArea()


//                GeometryReader { proxy in
//                    ZStack {
//                        Color.green
//
//                        if isColliding {
//                            Color.red.opacity(0.5)
//                                .frame(
//                                    width: proxy.size.width,
//                                    height: proxy.size.height
//                                )
//                        }
//                    }
//
//
//                }.ignoresSafeArea()
            }
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(currentPosition)
                .gesture(drag)
        }
    }

    func checkCollision() {




        isColliding = currentPosition.y >= greenViewPosition.y
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
