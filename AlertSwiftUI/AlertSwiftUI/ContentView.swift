//
//  ContentView.swift
//  AlertSwiftUI
//
//  Created by Pedro Rojas on 01/07/21.
//

import SwiftUI

struct User {
    let name: String
    let age: Int
}

enum DemoError: LocalizedError {
    case randomError

    var errorDescription: String? {
        return "Demo Error happened"
    }
}

struct ContentView: View {
    @State private var showAlert = false
    @State private var user = User(name: "Pitt", age: 25)
    @State private var error = DemoError.randomError

    var body: some View {
        let _ = Self._printChanges()
        Button("Tap to show alert") {
            showAlert = true
        }
//        .alert(
//            "Hello", isPresented: $showAlert, presenting: user
//        ) { user in
//            Button(role: .destructive) {
//                print("Delete it!")
//            } label: {
//                Text("Delete \(user.name)")
//            }
//            Button("Retry") {
//                print("Retry action")
//            }
//        } message: { user in
//            Text("My age is \(user.age)")
//        }
        .alert("Demo", isPresented: $showAlert, actions: {}, message: { Text("description") })

//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("Current Location Not Available"),
//                message: Text("Your current location can’t be " +
//                              "determined at this time.")
//            )
//        }
//        .alert(isPresented: $showAlert, error: error) { error in
//            Button("OK") {
//                print("ok error")
//            }
//        } message: { error in
//            Text("Error loading your content")
//        }

//        .alert(
//            "Hello", isPresented: $showAlert, presenting: user
//        ) { user in
//            Button("Default", role: .none, action: { print("Hello1") })
//            Button("Second", role: .cancel, action: { print("Hello2") })
//            Button("Destroy", role: .destructive, action: { print("Hello3") })
//        } message: { user in
//            Text(user.name)
//        }

//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("Current Location Not Available"),
//                message: Text("Your current location can’t be " +
//                                "determined at this time.")
//            )
//        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
