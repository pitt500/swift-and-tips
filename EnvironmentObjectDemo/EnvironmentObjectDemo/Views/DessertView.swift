//
//  DessertView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/3/21.
//

import SwiftUI

struct DessertView: View {
    var body: some View {
        OrderView(itemList: Food.sample, destination: Text("Confirmation"))
            .navigationTitle("Dessert")
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView()
    }
}
