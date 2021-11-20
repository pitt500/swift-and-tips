//
//  BottomSheetView.swift
//  UISheetPresentationControllerDemo
//
//  Created by Pedro Rojas on 19/11/21.
//

import SwiftUI

struct BottomSheetView<Content: View>: UIViewRepresentable {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("hello", for: .normal)
        button.addAction(UIAction { _ in
            let hostingController = UIHostingController(rootView: content())
            let viewController = BottomSheetViewController()

            viewController.addChild(hostingController)
            viewController.view.addSubview(hostingController.view)
            hostingController.view.pinToEdgesOf(viewController.view)
            hostingController.didMove(toParent: viewController)

            button.window?.rootViewController?.present(viewController, animated: true)
        }, for: .touchUpInside)


        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {

    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView {
            Text("Hello")
        }
    }
}


extension UIView {
    func pinToEdgesOf(_ other: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        leftAnchor.constraint(equalTo: other.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        rightAnchor.constraint(equalTo: other.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
}
