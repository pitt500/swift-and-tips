//
//  DessertView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct DessertView: View {
    @Binding var isPresented: Bool
    @Binding var selectedItems: [Food]
    @ObservedObject var userSettings: UserSettings
    
    var body: some View {
        OrderView(
            selectedItems: $selectedItems,
            itemList: Food.desserts,
            destination: CheckoutView(
                finalItems: selectedItems,
                isPresented: $isPresented,
                userSettings: userSettings
            )
        )
        .navigationTitle("Dessert")
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView(
            isPresented: .constant(true),
            selectedItems: .constant([]),
            userSettings: UserSettings(username: "Pitt")
        )
    }
}
