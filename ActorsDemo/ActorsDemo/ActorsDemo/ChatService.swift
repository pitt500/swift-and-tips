//
//  ChatService.swift
//  ChatService
//
//  Created by Pedro Rojas on 21/07/21.
//

import Foundation

actor ChatService {
    private var messageHistory: [Message] = []

    func newMessage(completion: (Message) -> Void) async {
        DispatchQueue.concurrentPerform(iterations: 200) { iteration in

            let message = Message(content: "Message #\(iteration)")
            Task {
                await self.saveMessage(message)
            }
            completion(message)
        }
    }

    func saveMessage(_ message: Message) {
        messageHistory.append(message)
    }
}
