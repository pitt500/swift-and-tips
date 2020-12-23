//
//  EmailField.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

struct EmailField: View {
    @Binding var email: String
    var placeholder: String
    var borderColor: Color
    
    var body: some View {
        TextField(placeholder, text: self.$email)
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

struct EmailField_Previews: PreviewProvider {
    static var previews: some View {
        EmailField(
            email: .constant("hello@pedrorojas.dev"),
            placeholder: "Please enter your email",
            borderColor: .blue
        )
    }
}

