//
//  OrderView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        List(0..<5) { index in
            OrderCell(item: Food(name: "burrito", price: 20.5))
        }
        .navigationTitle("Hello")
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderView()
        }
    }
}
