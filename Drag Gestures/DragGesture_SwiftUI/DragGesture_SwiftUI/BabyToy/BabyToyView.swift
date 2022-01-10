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
                viewModel.update(dragLocation: value.location)
                viewModel.update(isDragged: false)
            }

    }

    var body: some View {

        ZStack {
            Color.white
            HeaderView(
                record: viewModel.record,
                secondsElapsed: viewModel.secondsElapsed
            )

            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(viewModel.containerToys, id: \.id) { toy in
                    ToyView(toy: toy, viewModel: viewModel)
                }
            }

            if let currentToy = viewModel.currentToy {
                DraggableToy(
                    toy: currentToy,
                    position: viewModel.currentPosition,
                    gesture: drag
                )
                .opacity(viewModel.draggableObjectOpacity)
            }
        }
        .onAppear {
            viewModel.setupGame()
        }
        .ignoresSafeArea()
        .alert(
            Text("Congratulations, you won! 🎉"),
            isPresented: $viewModel.showAlert,
            actions: {
                Button("OK") {
                    viewModel.generateNewGame()
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
