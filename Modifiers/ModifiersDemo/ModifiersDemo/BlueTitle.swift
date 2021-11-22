//
//  BlueTitle.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 22/11/21.
//

import SwiftUI

struct BlueTitle: ViewModifier {
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(radius)
    }
}
