//
//  ItemList.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 22/11/21.
//

import SwiftUI

struct ItemList: View{
    static let aDay: TimeInterval = 86_400 //secods
    let food = [
        ("Eggs 🥚", Date(timeIntervalSinceNow: aDay)),
        ("Milk 🐮", Date(timeIntervalSinceNow: 0)),
        ("Bacon 🥓", Date(timeIntervalSinceNow: aDay)),
        ("Pancakes 🥞", Date(timeIntervalSinceNow: aDay))
    ]

    var body: some View {
        NavigationView {
            List(food, id: \.self.0) { item in
                Text(item.0)
                    .blueTitle()
                    .expired(date: item.1)
            }
            .navigationTitle("Food")
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
