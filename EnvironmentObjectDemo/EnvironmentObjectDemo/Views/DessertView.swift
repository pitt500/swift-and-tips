//
//  DessertView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct DessertView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        OrderView(
            itemList: Food.sample,
            destination: CheckoutView(finalItems: Food.sample, isPresented: $isPresented)
        )
        .navigationTitle("Dessert")
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView(isPresented: .constant(true))
    }
}
