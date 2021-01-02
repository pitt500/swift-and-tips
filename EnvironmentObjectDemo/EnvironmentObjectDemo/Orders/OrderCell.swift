//
//  OrderCell.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderCell: View {
    let item: ItemCart
    
    var body: some View {
        HStack {
            Image(item.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 100)
                .clipped()
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(item.name.capitalized)
                    .font(.title)
                Text("Description")
                    .font(.caption)
            }
            Spacer()
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(item: Food(name: "burrito", price: 20.5))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
