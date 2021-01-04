//
//  FoodView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct FoodView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        OrderView(itemList: Food.sample, destination: BeverageView(isPresented: $isPresented))
            .navigationTitle("Food")
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(isPresented: .constant(true))
    }
}
