//
//  OrderView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct OrderView<Content: View>: View {
    @State private var selected: Food?
    @Binding var selectedItems: [Food]
    let itemList: [Food]
    let destination: Content
    
    var body: some View {
        VStack {
            List(itemList) { item in
                Button(
                    action: {
                        addSelectionToList(item)
                    },
                    label: {
                        OrderCell(item: item, isSelected: item == selected)
                    }
                )
            }
            .listStyle(PlainListStyle())
            
            if selected != nil {
                NavigationLink(
                    destination: destination,
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
    private func addSelectionToList(_ item: Food) {
        if selected != nil {
            _ = selectedItems.popLast()
        }
        
        selected = item
        selectedItems.append(item)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderView(
                selectedItems: .constant([]),
                itemList: Food.sample,
                destination: Text("Hello")
            )
        }
    }
}
