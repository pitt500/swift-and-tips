//
//  BabyToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 06/01/22.
//

import SwiftUI

struct BabyToyView: View {
    @StateObject private var viewModel = ToyViewModel()
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewModel.update(dragLocation: value.location)
                viewModel.update(isDragged: true)
            }
            .onEnded { value in
                withAnimation {
                    viewModel.update(dragLocation: value.location)
                    viewModel.update(isDragged: false)
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
                        .minimumScaleFactor(0.9)
                        .position(x: proxy.size.width*0.5, y: proxy.size.height*0.15)
                }.frame(width: proxy.size.width*0.8)
            }

            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(viewModel.containerToys, id: \.id) { toy in
                    ToyView(toy: toy, viewModel: viewModel)
                }
            }

            DraggableObject(
                position: viewModel.currentPosition,
                gesture: drag
            )
        }
        .ignoresSafeArea()
        .alert(
            Text("Congratulations, you won! 🎉"),
            isPresented: $viewModel.showAlert,
            actions: {
                Button("OK") {
                    withAnimation {
                        viewModel.restart()
                    }
                }
            },
            message: {
                Text("Number of attemps: \(viewModel.attempts)")
            }
        )
    }

    var spacing: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 100
        }

        return 40
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
