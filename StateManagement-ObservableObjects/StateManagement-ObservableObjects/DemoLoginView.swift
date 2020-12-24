//
//  ContentView.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    var password = ""
    @Published var isUserLoggedIn = false
    
    var isValidEmail: Bool {
        isValid(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    func validateEmail() {
        isUserLoggedIn = isValidEmail
    }
    
    private func isValid(regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
}

struct DemoLoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    
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
            VStack {
                EmailField (
                    email: $loginVM.email,
                    placeholder: "Please enter your email",
                    borderColor: .gray
                )
                
                PasswordField (
                    password: $loginVM.password,
                    placeholder: "Please enter your password",
                    borderColor: .gray
                )
                
                Button(
                    action: { loginVM.validateEmail() },
                    label: {
                        Text("Log in")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(loginVM.isValidEmail ? Color.blue : Color.gray)
                    }
                )
                .disabled(!loginVM.isValidEmail)
            }
            .padding([.leading, .trailing], 24)
        }
        .padding()
        .fullScreenCover(
            isPresented: $loginVM.isUserLoggedIn,
            content: {
                MainAppDemo(email: $loginVM.email)
            }
        )
        
            
    }
}

struct DemoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        DemoLoginView()
    }
}


