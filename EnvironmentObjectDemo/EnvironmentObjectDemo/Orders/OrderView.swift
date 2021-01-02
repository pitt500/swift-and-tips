//
//  OrderView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        List(Food.sample) { item in
            OrderCell(item: item)
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
