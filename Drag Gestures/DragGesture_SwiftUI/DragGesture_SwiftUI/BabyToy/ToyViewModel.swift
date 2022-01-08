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
    @Published var showAlert = false
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
            return
        }

        highlighedId = nil
    }

    func update(isDragged: Bool){
        self.isDragged = isDragged

        if isDragged == false{
            if let highlighedId = self.highlighedId, highlighedId == 1 {
                selectedId = highlighedId
                showAlert = true
            } else {
                currentPosition = initialPosition
            }
            self.highlighedId = nil
        }
    }

    func isHighlighted(id: Int) -> Bool {
        return highlighedId == id
    }

    func restart() {
        currentPosition = initialPosition
        selectedId = nil
    }

}
