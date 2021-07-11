import SwiftUI
import PDFKit

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var document: PDFDocument?

    var body: some View {
        ZStack {
            Button(
                action: { isPickerPresented.toggle() },
                label: {
                    Text("Select your PDF")
                }
            )
            .frame(width: 150, height: 60)
            .sheet(isPresented: $isPickerPresented) {
                DocumentPicker(document: $document)
            }
            .sheet(item: $document) { doc in
                PDFComponent(document: doc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension PDFDocument: Identifiable {
    public var id: UUID {
        UUID()
    }
}
