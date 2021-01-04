//
//  ContentView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct MainView: View {
    @State private var startOrder = false
    @Environment(\.settings) var settings: UserSettings
    @Environment(\.cart) var cart: [Food]
    
    var body: some View {
        
        if cart.isEmpty {
            VStack {
                Text("Welcome back \(settings.username)! 👋🏼")
                    .font(.title)
                    .sheet(isPresented: $startOrder, content: {
                        NavigationView {
                            FoodView(isPresented: $startOrder)
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
                Text("Your order with \(cart.count) items is on the go!")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
