//
//  LoginBankViewModel.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 18/02/21.
//

import Combine

class LoginBankViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var shouldMoveToNextScreen = false

    private var validPin = "223344"

    func validate(text: String) {
        shouldMoveToNextScreen = text == validPin
    }
}
