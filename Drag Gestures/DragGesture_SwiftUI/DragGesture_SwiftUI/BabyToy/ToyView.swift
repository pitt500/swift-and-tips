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

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(toy.color)
                .frame(width: 100, height: 100)
            if viewModel.isHighlighted(id: toy.id) {
                Circle()
                    .fill(toy.color)
                    .opacity(0.5)
                    .frame(width: 120, height: 120)
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
        .frame(width: 120, height: 120)
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
