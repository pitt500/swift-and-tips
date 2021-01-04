//
//  BeverageView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct BeverageView: View {
    @Binding var isPresented: Bool
    @Binding var selectedItems: [Food]
    @ObservedObject var userSettings: UserSettings
    
    var body: some View {
        OrderView(
            selectedItems: $selectedItems,
            itemList: Food.beverages,
            destination: DessertView(
                isPresented: $isPresented,
                selectedItems: $selectedItems,
                userSettings: userSettings
            )
        )
        .navigationTitle("Beverage")
    }
}

struct BeverageView_Previews: PreviewProvider {
    static var previews: some View {
        BeverageView(
            isPresented: .constant(true),
            selectedItems: .constant([]),
            userSettings: UserSettings(username: "Pitt")
        )
    }
}
