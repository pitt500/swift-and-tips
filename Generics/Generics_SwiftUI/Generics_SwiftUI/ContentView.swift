//
//  ContentView.swift
//  Generics_SwiftUI
//
//  Created by Pedro Rojas on 23/03/21.
//

import SwiftUI

struct CardView<Content: View>: View {
    let content: Content

    var body: some View {
        ZStack {
            BackgroundGradientView(color: .green)
            ZStack {
                Color.white
                content
                    .font(.system(size: 50))
            }
            .cornerRadius(20)
            .padding(20)
            .shadow(radius: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: Text("♦️"))
    }
}
