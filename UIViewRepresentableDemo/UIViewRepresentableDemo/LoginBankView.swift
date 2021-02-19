//
//  ContentView.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 15/02/21.
//

import SwiftUI

struct LoginBankView: View {
    @State private var text = ""

    var body: some View {
        ZStack {
            BackgroundGradientView(color: .blue)
            VStack(alignment: .center) {
                BankTitle()
                    .foregroundColor(.white)
                    .padding(.bottom, 30)

                Text("Please enter your pin code:")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                PinCodeField(text: $text)
                    .frame(width: 245, height: 60)
                    .padding(.leading, 30)

            }
        }
        .fullScreenCover(
            isPresented: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
            content: Text("🤑Money!"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginBankView()
    }
}
