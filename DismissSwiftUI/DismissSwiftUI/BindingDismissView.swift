//
//  BindingDismissView.swift
//  DismissSwiftUI
//
//  Created by Pedro Rojas on 02/07/21.
//

import SwiftUI

import SwiftUI

struct BindingDismissView: View {
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
                ModalBindingDismissView(isPresented: $showModal)
            }


        }
    }
}

struct ModalBindingDismissView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Press to dismiss") {
            isPresented = false
        }
    }
}

struct BindingDismissView_Previews: PreviewProvider {
    static var previews: some View {
        BindingDismissView()
    }
}

