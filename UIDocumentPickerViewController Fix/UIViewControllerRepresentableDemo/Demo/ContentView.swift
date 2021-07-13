import SwiftUI
import PDFKit

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var documentUrl: URL?

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
                DocumentPicker(url: $documentUrl)
            }
            .sheet(item: $documentUrl) { url in
                PDFComponent(url: url)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension URL: Identifiable {
    public var id: String {
        return self.absoluteString
    }
}
