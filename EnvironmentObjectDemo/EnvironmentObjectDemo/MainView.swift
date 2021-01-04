//
//  ContentView.swift
//  EnvironmentObjectDemo
//
//  Created by Pedro Rojas on 1/1/21.
//

import SwiftUI

struct MainView: View {
    @State private var startOrder = false
    
    var body: some View {
        
        VStack {
            Text("Welcome! 👋🏼")
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
        MainView()
    }
}
