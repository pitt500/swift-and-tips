
import SwiftUI

struct PresentationModeView: View {
    @State private var showModal = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Show Modal") {
                    showModal.toggle()
                }
            }
            .sheet(isPresented: $showModal) {
                print("View Dismissed")
            } content: {
                ModalPresentationView()
            }


        }
    }
}

struct ModalPresentationView: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationModeView()
    }
}

