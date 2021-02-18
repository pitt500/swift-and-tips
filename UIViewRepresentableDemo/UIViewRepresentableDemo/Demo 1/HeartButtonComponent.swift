//
//  HeartButtonComponent.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 17/02/21.
//

import SwiftUI

struct HeartButtonComponent: UIViewRepresentable {
    typealias UIViewType = UIButton

    var action: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIButton {
        let button = HeartButton()

        button.addTarget(
            context.coordinator,
            action: #selector(context.coordinator.callAction),
            for: .touchUpInside
        )

        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {
        context.coordinator.action = action

    }

}

extension HeartButtonComponent {
    class Coordinator {
        var action: (() -> Void)?

        var parent: HeartButtonComponent

        init(_ button: HeartButtonComponent) {
            self.parent = button
        }

        @objc func callAction(sender: UIButton) {
            sender.isSelected.toggle()
            action?()
        }
    }
}
