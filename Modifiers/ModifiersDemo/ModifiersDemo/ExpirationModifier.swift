//
//  ExpirationModifier.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 22/11/21.
//

import SwiftUI

struct ExpirationModifier: ViewModifier {
    let date: Date

    func body(content: Content) -> some View {
        if date < .now {
            content.opacity(0.3)
        } else {
            content
        }
    }
}

extension View {
    func expired(date: Date) -> some View {
        modifier(ExpirationModifier(date: date))
    }
}
