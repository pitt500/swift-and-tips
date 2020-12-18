//
//  DemoLoginView.swift
//  StateManagementDemo
//
//  Created by Pedro Rojas on 12/16/20.
//

import SwiftUI

struct DemoLoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isUserLoggedIn = false
    
    var body: some View {
        VStack {
            Text("AmiiboLand!")
                .font (
                    .system(
                        size: 40,
                        weight: .semibold,
                        design: .rounded
                    )
                )
                .padding(.bottom, 60)
            EmailField (
                email: $email,
                placeholder: "Please enter your email",
                borderColor: .gray
            )
            .padding([.leading, .trailing], 24)
            
            PasswordField (
                password: $password,
                placeholder: "Please enter your password",
                borderColor: .gray
            )
            .padding([.leading, .trailing], 24)
            
            Button(
                action: { isUserLoggedIn = true },
                label: { Text("Log in") }
            )
        }
        .padding()
        .fullScreenCover(
            isPresented: $isUserLoggedIn,
            content: {
                MainAppDemo(email: $email)
            }
        )
        
            
    }
}

struct DemoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        DemoLoginView()
    }
}
