//
//  BankTitle.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 18/02/21.
//

import SwiftUI

struct BankTitle: View {
    var body: some View {
        HStack {
            Image("cocoa")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.gray, lineWidth: 4)
                )
            Text("CocoaBank")
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .shadow(radius: 10)
    }
}

struct BankTitle_Previews: PreviewProvider {
    static var previews: some View {
        BankTitle()
    }
}
