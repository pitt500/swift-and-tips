//
//  FoodView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct FoodView: View {
    var body: some View {
        OrderView(itemList: Food.sample, destination: BeverageView())
            .navigationTitle("Food")
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
