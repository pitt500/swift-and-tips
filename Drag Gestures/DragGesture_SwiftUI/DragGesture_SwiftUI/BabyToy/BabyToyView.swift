//
//  BabyToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 06/01/22.
//

import SwiftUI

struct BabyToyView: View {
    @StateObject private var viewModel = ToyViewModel()

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
                        .position(x: proxy.size.width*0.5, y: proxy.size.height*0.1)
                }.frame(width: proxy.size.width*0.5)
            }

            HStack {
                ToyView(
                    toy: Toy(id: 1, color: .red),
                    viewModel: viewModel
                )

                Spacer()
                    .frame(maxWidth: 80)
                ToyView(
                    toy: Toy(id: 2, color: .green),
                    viewModel: viewModel
                )
                Spacer()
                    .frame(maxWidth: 80)
                ToyView(
                    toy: Toy(id: 3, color: .blue),
                    viewModel: viewModel
                )
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
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
