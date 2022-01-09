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
    @Published var currentPosition = initialPosition

    @Published var containerToys = [
        Toy(id: 1, color: .red),
        Toy(id: 2, color: .blue),
        Toy(id: 3, color: .green),
        Toy(id: 4, color: .black),
        Toy(id: 5, color: .orange),
        Toy(id: 6, color: .purple),
    ]

    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )

    private var frames: [Int: CGRect] = [:]
    private(set) var attempts = 0

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
        guard isDragged == false else { return }
        defer { self.highlighedId = nil }

        guard let highlighedId = self.highlighedId else {
            currentPosition = ToyViewModel.initialPosition
            return
        }

        if highlighedId == 1 {
            selectedId = highlighedId
            showAlert = true
        } else {
            currentPosition = ToyViewModel.initialPosition
        }

        attempts += 1
    }

    func isHighlighted(id: Int) -> Bool {
        return highlighedId == id
    }

    func restart() {
        containerToys.shuffle()
        currentPosition = ToyViewModel.initialPosition
        selectedId = nil
    }

}
