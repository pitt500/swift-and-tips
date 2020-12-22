//
//  MainAppDemo.swift
//  StateManagementDemo
//
//  Created by Pedro Rojas on 12/16/20.
//

import SwiftUI

struct MainAppDemo: View {
    @Binding var email: String
    
    var body: some View {
        Text("Email: \(email)")
    }
}

struct MainAppDemo_Previews: PreviewProvider {
    static var previews: some View {
        MainAppDemo(
            email: .constant("hello@pedrorojas.dev")
        )
    }
}
