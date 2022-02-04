//
//  SoccerImage.swift
//  MagnificationGestureDemo
//
//  Created by Pedro Rojas on 04/02/22.
//

import SwiftUI

struct SoccerObject: Identifiable {
    let id = UUID()
    let image: Image
}

extension SoccerObject {
    static var sample: [SoccerObject] {
        let totalNumberOfImages = 28
        return Array(1...totalNumberOfImages).map { name in
            SoccerObject(image: Image("\(name)"))
        }
    }
}
