//
//  PlayerViewModel.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    let media: Media
    @Published private(set) var isPlaying = true
    @Published private(set) var progressOffset: CGFloat = 80

    init(media: Media) {
        self.media = media
    }

    var durationInMinutes: String {
        let seconds = Int(media.duration) / 1000
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60

        return "\(minutes):\(remainingSeconds)"
    }

    func play() {
        progressOffset = 80
        isPlaying.toggle()
    }

    func backward() {
        progressOffset = 0
    }

    func forward() {
        //Dummy value, just for demo
        progressOffset = UIScreen.main.bounds.width - 40
    }

    func onChange(_ value: DragGesture.Value) {
        self.progressOffset = value.location.x
    }

}
