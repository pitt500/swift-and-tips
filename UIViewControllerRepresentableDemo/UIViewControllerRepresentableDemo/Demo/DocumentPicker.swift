//
//  DocumentPicker.swift
//  UIViewControllerRepresentableDemo
//
//  Created by Pedro Rojas on 26/02/21.
//

import UIKit
import SwiftUI
import PDFKit

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var url: URL?

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let viewController = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        viewController.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        print("Hello")
    }
}

extension DocumentPicker {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPicker

        init(_ documentPicker: DocumentPicker) {
            self.parent = documentPicker
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            /*
             IMPORTANT!
             This configuration won't work in a real device.
             I did a fix here and you can learn more watching
             this video:
             */
            guard let url = urls.first else { return }
            parent.url = url
        }
    }
}
