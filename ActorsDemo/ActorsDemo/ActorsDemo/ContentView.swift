//
//  ContentView.swift
//  ActorsDemo
//
//  Created by Pedro Rojas on 19/07/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var chatManager = GroupChat()

    var body: some View {
        List(chatManager.messages) { message in
            Text("\(message.content)")
        }
            .task {
                await chatManager.generateMessages()
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
