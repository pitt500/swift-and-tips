import PDFKit
import SwiftUI

struct PDFComponent: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> PDFView {

        let pdfView = PDFView()

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

        guard url.startAccessingSecurityScopedResource()
        else { return pdfView }

        //Using defer to always execute this line at the end.
        defer { url.stopAccessingSecurityScopedResource() }

        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        print("PDF Component printed!")
    }
}

