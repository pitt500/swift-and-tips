//
//  BeverageView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct BeverageView: View {
    var body: some View {
        OrderView(itemList: Food.sample, destination: DessertView())
            .navigationTitle("Beverage")
    }
}

struct BeverageView_Previews: PreviewProvider {
    static var previews: some View {
        BeverageView()
    }
}
