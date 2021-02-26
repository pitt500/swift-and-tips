//
//  DocumentPicker.swift
//  UIViewControllerRepresentableDemo
//
//  Created by Pedro Rojas on 26/02/21.
//

import UIKit
import SwiftUI

struct DocumentPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let viewController = UIDocumentPickerViewController(forOpeningContentTypes: [.aiff])
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        print("Hello")
    }
}

