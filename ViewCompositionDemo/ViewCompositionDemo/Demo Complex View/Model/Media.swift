//
//  Media.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import SwiftUI

struct Media {
    let name: String
    let artist: String
    let duration: TimeInterval
    let imageName: String
    let color: Color
}

extension Media {
    static let demo = Media(
        name: "Bohemian Rhapsody",
        artist: "Queen",
        duration: 330000,
        imageName: "queen",
        color: .pink
    )
}
