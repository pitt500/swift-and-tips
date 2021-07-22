//
//  ActorModel.swift
//  ActorModel
//
//  Created by Pedro Rojas on 19/07/21.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let date = Date()
}

class GroupChat: ObservableObject {
    var messages: [Message] = []

    func newMessage(_ message: Message) {
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            //Thread.sleep(forTimeInterval: TimeInterval.random(in: 1...3))
//            self.messages.append(message)
//            print(self.messages.map(\.content))
//        }

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
    func generateMessages() {
        DispatchQueue.concurrentPerform(iterations: 5) { iteration in
            newMessage(
                Message(content: "Message #\(iteration)")
            )
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
