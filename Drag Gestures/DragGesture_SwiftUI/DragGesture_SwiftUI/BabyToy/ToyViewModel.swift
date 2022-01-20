//
//  ToyViewModel.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 08/01/22.
//

import SwiftUI

class ToyViewModel: ObservableObject {
    // MARK: - Gesture Properties
    @Published var highlighedId: Int?
    //@Published var selectedId: Int?
    @Published var showAlert = false
    @Published var currentPosition = initialPosition
    @Published var currentToy: Toy?
    @Published var draggableObjectOpacity: CGFloat = 1.0
    private(set) var attempts = 0

    // MARK: - Timer Properties
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    var record: Double?

    // MARK: Objects in the screen
    private var toys = Array(Toy.all.shuffled().prefix(upTo: 3))
    @Published var containerToys = Toy.all.shuffled()

    // MARK: - Coordinates
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )
    private var frames: [Int: CGRect] = [:]

    // MARK: - Game Lifecycle methods
    func setupGame() {
        currentToy = toys.popLast()
        startTimer()
    }

    func restart() {
        withAnimation {
            containerToys.shuffle()
        }

        withAnimation(.none) {
            currentPosition = ToyViewModel.initialPosition

            withAnimation {
                draggableObjectOpacity = 1
            }
        }

        //selectedId = nil
    }

    func nextGame() {
        currentToy = toys.popLast()

        if currentToy == nil {
            gameOver()
        } else {
            restart()
        }
    }

    func generateNewGame() {
        toys = Array(Toy.all.shuffled().prefix(upTo: 3))
        attempts = 0
        startTimer()
        nextGame()
    }

    func gameOver() {
        timer.invalidate()
        saveRecord()
        showAlert = true
    }

    // MARK: - Updates in the screen

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
        defer { self.highlighedId = nil }

        withAnimation {
            guard let highlighedId = self.highlighedId else {
                currentPosition = ToyViewModel.initialPosition
                return
            }

            if highlighedId == currentToy?.id {
                //selectedId = highlighedId
                guard let frame = frames[highlighedId] else { return }
                currentPosition = CGPoint(x: frame.midX, y: frame.midY)
                draggableObjectOpacity = 0
                nextGame()
            } else {
                currentPosition = ToyViewModel.initialPosition
            }

            attempts += 1
        }
    }

    func isHighlighted(id: Int) -> Bool {
        return highlighedId == id
    }


    // MARK: - Timer methods
    func startTimer() {
        secondsElapsed = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }

    func saveRecord() {
        guard let record = record else {
            self.record = secondsElapsed
            return
        }

        self.record = min(secondsElapsed, record)
    }
}
