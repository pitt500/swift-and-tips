//
//  PinCodeField.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 17/02/21.
//

import SwiftUI

struct PinCodeField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        let spacing = 20
        textfield.keyboardType = .numberPad
        textfield.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textfield.textColor = .white
        textfield.defaultTextAttributes.updateValue(spacing, forKey: .kern)
        textfield.attributedPlaceholder = NSAttributedString(string: "______", attributes: [.kern: spacing, .foregroundColor: UIColor.white])

        textfield.delegate = context.coordinator

        return textfield
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        print("SwiftUI View is updating")
    }
}

extension PinCodeField {

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: PinCodeField
        private let maxLength = 6


        init(_ parent: PinCodeField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
//            print("text(current text): \(text.count)")
//            print("string (added): \(string.count)")
//            print("range (deleted): \(range.length)")

            if newLength == maxLength  {
                textField.text = textField.text! + string
                textField.resignFirstResponder()
            }

            return newLength <= maxLength
        }

        // Don't forget to add this method, otherwise, your SwiftUI View
        // won't update
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }


    }
}
