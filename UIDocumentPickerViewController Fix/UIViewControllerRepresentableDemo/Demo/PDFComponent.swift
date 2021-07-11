import PDFKit
import SwiftUI

struct PDFComponent: UIViewRepresentable {
    let document: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = document
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        pdfView.usePageViewController(true)
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        print("PDF Component printed!")
    }
}

