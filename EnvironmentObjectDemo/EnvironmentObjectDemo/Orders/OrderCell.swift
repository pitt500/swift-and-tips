//
//  OrderCell.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderCell: View {
    let item: Food
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 100)
                .clipped()
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(item.name.capitalized)
                    .font(.title)
                Text(item.description)
                    .font(.caption)
            }
            Spacer()
            
            if isSelected {
                Text("✅")
            }
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(item: Food.sample[0], isSelected: true)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
