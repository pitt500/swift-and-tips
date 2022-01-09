//
//  ToyView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 07/01/22.
//

import SwiftUI

struct ToyView: View {
    let toy: Toy
    @ObservedObject var viewModel: ToyViewModel
    private let sizeHighlighted: CGFloat = 130
    private let regularSize: CGFloat = 100

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(toy.color)
                .frame(width: regularSize, height: regularSize)
            if viewModel.isHighlighted(id: toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.5)
                    .frame(width: sizeHighlighted, height: sizeHighlighted)
            }
        }
        .overlay {
            GeometryReader { proxy -> Color in
                viewModel.update(
                    frame: proxy.frame(in: .global),
                    for: toy.id
                )

                return Color.clear
            }
        }
        .frame(width: sizeHighlighted, height: sizeHighlighted)
    }
}

struct ToyView_Previews: PreviewProvider {
    static var previews: some View {
        ToyView(
            toy: Toy(id: 1, color: .red),
            viewModel: ToyViewModel()
        )
    }
}
