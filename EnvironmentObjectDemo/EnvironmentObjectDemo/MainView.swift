//
//  ContentView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct MainView: View {
    @State private var startOrder = false
    @ObservedObject var userSettings: UserSettings
    
    var body: some View {
        
        if userSettings.cart.isEmpty {
            VStack {
                Text("Welcome back \(userSettings.username)! 👋🏼")
                    .font(.title)
                    .sheet(isPresented: $startOrder, content: {
                        NavigationView {
                            FoodView(
                                isPresented: $startOrder,
                                userSettings: userSettings
                            )
                        }
                    })
                
                Button("Make an order", action: { startOrder = true })
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
            }
        } else {
            VStack {
                Text("Thanks for your purchase!")
                    .font(.title)
                Text("Your order with \(userSettings.cart.count) items is on the go!")
                
            }
        }
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(userSettings: UserSettings(username: "Pitt"))
    }
}
