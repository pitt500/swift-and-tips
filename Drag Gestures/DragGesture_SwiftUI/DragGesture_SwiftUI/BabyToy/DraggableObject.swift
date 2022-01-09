//
//  DraggableObject.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 08/01/22.
//

import SwiftUI

struct DraggableObject<Draggable: Gesture>: View {
    let position: CGPoint
    let gesture: Draggable
    private let size: CGFloat = 100

    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: size, height: size)
            .position(position)
            .gesture(gesture)
    }
}

struct DraggableObject_Previews: PreviewProvider {
    static var previews: some View {
        DraggableObject(
            position: .zero,
            gesture: DragGesture()
        )
    }
}
