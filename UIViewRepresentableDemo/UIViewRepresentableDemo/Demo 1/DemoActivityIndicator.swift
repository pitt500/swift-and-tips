//
//  DemoActivityIndicator.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 19/02/21.
//

import SwiftUI

struct DemoActivityIndicator: View {
    @State private var isLoading = false

    var body: some View {
        VStack {
            ActivityIndicator(
                isLoading: isLoading,
                style: .large
            )
            .padding(.bottom, 20)
            Button(
                action: { isLoading.toggle() },
                label: {
                    Text("Change value")
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                }
            )
        }
    }
}

struct DemoActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DemoActivityIndicator()
    }
}
