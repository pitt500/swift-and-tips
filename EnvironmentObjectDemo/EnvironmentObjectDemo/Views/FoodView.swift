//
//  FoodView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct FoodView: View {
    @Binding var isPresented: Bool
    @State private var selectedItems: [Food] = []
    @ObservedObject var userSettings: UserSettings
    
    var body: some View {
        OrderView(
            selectedItems: $selectedItems,
            itemList: Food.sample,
            destination: BeverageView(
                isPresented: $isPresented,
                selectedItems: $selectedItems,
                userSettings: userSettings
            )
        )
        .navigationTitle("Food")
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(
            isPresented: .constant(true),
            userSettings: UserSettings(username: "Pitt")
        )
    }
}
