//
//  DismissDemo.swift
//  DismissSwiftUI
//
//  Created by Pedro Rojas on 02/07/21.
//

import SwiftUI

struct DismissDemo: View {
    var body: some View {
        NavigationView {
            List {
                Section("iOS 13 & 14") {
                    NavigationLink(destination: BindingDismissView()) {
                        Text("Binding Dismiss")
                    }
                    NavigationLink(destination: PresentationModeView()) {
                        Text("PresentationMode Dismiss")
                    }
                }
                Section("iOS 15+") {
                    NavigationLink(destination: DismissView()) {
                        Text("Dismiss Key")
                    }
                }

            }
            .navigationTitle("Dismiss Demo")
        }
    }
}

struct DismissDemo_Previews: PreviewProvider {
    static var previews: some View {
        DismissDemo()
    }
}
