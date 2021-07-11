import UIKit
import SwiftUI
import PDFKit

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var document: PDFDocument?

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
             The url provided is a security-scoped URL for the
             directory that permits your app to access content
             outside its container (this app).

             For that reason, we have to read it securely using:
             - startAccessingSecurityScopedResource()
             - stopAccessingSecurityScopedResource()

             You can read more here:
             - https://developer.apple.com/documentation/uikit/uidocumentpickerviewcontroller
             - https://developer.apple.com/documentation/uikit/view_controllers/providing_access_to_directories

             Without this implementation, the PDF (or any document) cannot be displayed in a real device.
             Check the issue here: https://twitter.com/swiftandtips/status/1413967476333944834

             and Thanks to user @Bogdan Cuza on YT that helped me to discover the bug :)
            */

            guard let url = urls.first,
                  url.startAccessingSecurityScopedResource()
            else { return }

            defer {
                url.stopAccessingSecurityScopedResource()
            }

            // You can work and save the url by using bookmarks (more in the doc above),
            // but for this demo I instead create a PDFDocument object.
            print(url.absoluteString)
            parent.document = PDFDocument(url: url)
        }
    }
}
