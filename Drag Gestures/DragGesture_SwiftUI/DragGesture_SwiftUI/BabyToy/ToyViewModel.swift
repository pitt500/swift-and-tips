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

    private var frames: [Int: CGRect] = [:]

    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }

    func update(dragLocation: CGPoint) {
        for (id, frame) in frames where frame.contains(dragLocation) {
            highlighedId = id
            return
        }

        highlighedId = nil
    }

    func update(isDragged: Bool){
        self.isDragged = isDragged

        if isDragged == false, let highlighedId = self.highlighedId {
            selectedId = id
            self.highlighedId = nil
        }
    }

}
