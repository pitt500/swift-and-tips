//
//  ExpirationModifier.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 22/11/21.
//

import SwiftUI

struct ExpirationModifier: ViewModifier {
    let expired: Bool

    init(_ expired: Bool) {
        self.expired = expired
    }

    func body(content: Content) -> some View {
//        if expired {
//            content.opacity(0.3)
//        } else {
//            content
//        }

        content.opacity(expired ? 0.3 : 1.0)
    }
}

extension View {
    func expired(_ expired: Bool) -> some View {
        modifier(ExpirationModifier(expired))
    }
}
