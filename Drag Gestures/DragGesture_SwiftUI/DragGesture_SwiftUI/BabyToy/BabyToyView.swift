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

    @State private var currentPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY * 1.5
    )

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                currentPosition = value.location
            }
            .onEnded { value in
                withAnimation {
                    currentPosition = initialPosition
                }
            }

    }

    var body: some View {

        ZStack {
            Color.white
            GeometryReader { proxy in
                VStack(alignment: .center) {
                    Text("Drag and drop the shape in the correct place")
                        .font(.largeTitle)
                        .position(x: proxy.size.width*0.5, y: proxy.size.height*0.1)
                }.frame(width: proxy.size.width*0.5)
            }

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

            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(currentPosition)
                .gesture(drag)
                .zIndex(4)


        }
        .ignoresSafeArea()
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
