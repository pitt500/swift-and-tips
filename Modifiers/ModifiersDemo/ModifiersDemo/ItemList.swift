//
//  ItemList.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 22/11/21.
//

import SwiftUI

struct TodoList: View{
    @StateObject var viewModel = TodoListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todoItems) { item in
                    Text(item.name)
                        .blueTitle()
                        .expired(item.done)
                        .onTapGesture {
                            viewModel.updateItem(item)
                        }
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Todo")
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}


struct TodoItem: Identifiable {
    let id = UUID()
    let name: String
    var done: Bool = false

    private static let aDayLater: TimeInterval = 86_400
    static let sample: [TodoItem] = [
        .init(
            name: "Clean room 🧹"
        ),
        .init(
            name: "Edit video 🎥"
        ),
        .init(
            name: "Prepare workshop 🧠"
        ),
        .init(
            name: "Publish Video 🎉"
        ),
        .init(
            name: "Write script 📝"
        ),
        .init(
            name: "Go to dentist 🦷"
        ),
        .init(
            name: "Go to groceries store 🥑"
        )
    ]
}
