//
//  ToyViewModel.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 08/01/22.
//

import SwiftUI

class ToyViewModel: ObservableObject {
    @Published var isDragged = false
    @Published var highlighedId: Int?
    @Published var selectedId: Int?
    private let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY * 1.5
    )

    @Published var currentPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY * 1.5
    )

    private var frames: [Int: CGRect] = [:]

    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }

    func update(dragLocation: CGPoint) {
        currentPosition = dragLocation
        for (id, frame) in frames where frame.contains(dragLocation) {
            highlighedId = id
            print(currentPosition)
            return
        }

        highlighedId = nil
    }

    func update(isDragged: Bool){
        self.isDragged = isDragged

        if isDragged == false{
            if let highlighedId = self.highlighedId {
                selectedId = highlighedId
                self.highlighedId = nil
            } else {
                currentPosition = initialPosition
            }
        }
    }

    func isViewHighlighted(id: Int?) -> Bool {
        highlighedId == id
    }

}
