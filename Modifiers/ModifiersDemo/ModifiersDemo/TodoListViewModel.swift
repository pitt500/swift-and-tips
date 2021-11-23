//
//  TodoListViewModel.swift
//  ModifiersDemo
//
//  Created by Pedro Rojas on 23/11/21.
//

import Combine

class TodoListViewModel: ObservableObject {
    @Published var todoItems = TodoItem.sample

    func updateItem(_ item: TodoItem) {
        guard let index = todoItems
                .firstIndex(where: { $0.id == item.id })
        else { return }
        todoItems[index].done.toggle()
    }
}
