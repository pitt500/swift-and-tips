//
//  ContentView.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 15/02/21.
//

import SwiftUI

struct LoginBankView: View {
    @StateObject private var viewModel = LoginBankViewModel()

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
                PinCodeField(text: $viewModel.text)
                    .onChange(
                        of: viewModel.text,
                        perform: { viewModel.validate(text: $0) }
                    )
                    .frame(width: 245, height: 60)
                    .padding(.leading, 30)

            }
        }
        .sheet(isPresented: $viewModel.shouldMoveToNextScreen) {
            MainBankView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginBankView()
    }
}
