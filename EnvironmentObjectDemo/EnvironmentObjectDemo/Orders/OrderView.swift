//
//  OrderView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderView: View {
    @State var selected: Food?
    let itemList: [Food]
    
    var body: some View {
        VStack {
            List(Food.sample) { item in
                Button(
                    action: { selected = item },
                    label: {
                        OrderCell(item: item, isSelected: item == selected)
                    }
                )
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello")
            
            if selected != nil {
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Next")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding()
                            
                            
                    }
                )
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderView(
                itemList: Food.sample
            )
        }
    }
}
