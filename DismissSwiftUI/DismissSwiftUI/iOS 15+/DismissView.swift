//
//  DismissView.swift
//  DismissSwiftUI
//
//  Created by Pedro Rojas on 02/07/21.
//

import SwiftUI

struct DismissView: View {
    @State private var showModal = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Show Sheet") {
                    showModal.toggle()
                }
            }
            .sheet(isPresented: $showModal) {
                print("View Dismissed")
            } content: {
                ModalDismissViewView()
            }


        }
    }
}

struct ModalDismissViewView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
    }
}

struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}
