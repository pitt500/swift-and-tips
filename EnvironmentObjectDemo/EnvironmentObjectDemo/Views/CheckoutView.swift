//
//  CheckoutView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct CheckoutView: View {
    let finalItems: [Food]
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Do you want to proceed with your order?")
                .font(.title)
                .multilineTextAlignment(.center)
            List(finalItems) {
                OrderCell(item: $0, isSelected: false)
            }
            
            Button(
                action: { isPresented = false},
                label: {
                    Text("Pay")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                }
            )
        }
        .navigationTitle("Checkout")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(finalItems: Food.sample, isPresented: .constant(true))
    }
}
