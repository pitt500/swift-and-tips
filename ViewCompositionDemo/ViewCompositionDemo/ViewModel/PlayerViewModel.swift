//
//  PlayerViewModel.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import Foundation

class PlayerViewModel: ObservableObject {
    let media: Media

    init(media: Media) {
        self.media = media
    }

    var durationInMinutes: String {
        let seconds = Int(media.duration) / 1000
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60

        return "\(minutes):\(remainingSeconds)"
    }
}
