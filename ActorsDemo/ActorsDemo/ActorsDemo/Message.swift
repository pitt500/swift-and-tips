//
//  Message.swift
//  Message
//
//  Created by Pedro Rojas on 21/07/21.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    let content: String
    let date: Date

    init(id: UUID = UUID(), content: String, date: Date = Date()) {
        self.id = id
        self.content = content
        self.date = date
    }
}
