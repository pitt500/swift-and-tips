//
//  ChatService.swift
//  ChatService
//
//  Created by Pedro Rojas on 21/07/21.
//

import Foundation

class ChatService {
    private var messageHistory: [Message] = []

    func newMessage(completion: (Message) -> Void) {
        DispatchQueue.concurrentPerform(iterations: 100) { iteration in

            let message = Message(content: "Message #\(iteration)")
            messageHistory.append(message)
            completion(message)
        }
    }
}
