//
//  GestureView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 06/01/22.
//

import SwiftUI

struct GestureView: View {
    @State var viewState = CGSize.zero

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                withAnimation {
                    viewState = .zero
                }
            }
    }

    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .offset(x: viewState.width, y: viewState.height)
            .gesture(drag)

    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
