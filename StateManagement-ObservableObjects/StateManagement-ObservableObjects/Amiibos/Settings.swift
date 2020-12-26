//
//  Settings.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var user: User
    
    var body: some View {
        VStack {
            TextField("", text: $user.name)
                .multilineTextAlignment(.center)
            Text("\(user.itemCounter)")
            Button(
                action: {
                    user.itemCounter += 1
                },
                label: {
                    Text("Tap me!")
                }
            )
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(user: User())
    }
}
