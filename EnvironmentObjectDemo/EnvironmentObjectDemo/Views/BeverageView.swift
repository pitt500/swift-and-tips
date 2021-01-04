//
//  BeverageView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct BeverageView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        OrderView(
            itemList: Food.sample,
            destination: DessertView(isPresented: $isPresented))
            .navigationTitle("Beverage")
    }
}

struct BeverageView_Previews: PreviewProvider {
    static var previews: some View {
        BeverageView(isPresented: .constant(true))
    }
}
