//
//  ContentView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    let isEmpty = false
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.pink.opacity(0.7),
                        Color.pink.opacity(0.4)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Image("queen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Bohemian Rhapsody")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
