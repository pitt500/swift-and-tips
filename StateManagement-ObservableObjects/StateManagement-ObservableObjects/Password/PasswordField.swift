//
//  PasswordField.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    var placeholder: String
    var borderColor: Color
    
    var body: some View {
        SecureField(placeholder, text: self.$password)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
                    .frame(height: 44)
                    .padding([.leading, .trailing], -16)
            )
            .frame(height: 30)
            .padding()
        
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(
            password: .constant(""),
            placeholder: "Enter your password here",
            borderColor: .blue
        )
    }
}

