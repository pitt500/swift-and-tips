//
//  ActorModel.swift
//  ActorModel
//
//  Created by Pedro Rojas on 19/07/21.
//

import SwiftUI

class GroupChat: ObservableObject {
    @Published var messages: [Message] = []
    let service = ChatService()

    func newMessage(_ message: Message) {
        self.messages.append(message)
        print(messages.map(\.content))
        //self.messages.append(message)
    }

    func showLastMessages(number: Int) -> [Message] {
        return Array(messages.suffix(from: number))
    }

    func showFirstMessages(number: Int) -> [Message] {
        return Array(messages.prefix(upTo: number))
    }
}

extension GroupChat {
    var last: Message? {
        messages.last
    }

    var first: Message? {
        messages.first
    }
}

extension GroupChat {
    func generateMessages() async {
        await service.newMessage { message in
            DispatchQueue.main.async {
                self.messages.append(message)
            }
        }
    }
}

//extension ChatManager
//
//extension Book: Hashable {
//    nonisolated func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}
//
//extension Book: Equatable {
//    static func == (lhs: Book, rhs: Book) -> Bool {
//        lhs.id == rhs.id
//    }
//}
