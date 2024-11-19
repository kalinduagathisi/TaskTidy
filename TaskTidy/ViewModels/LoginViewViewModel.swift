//
//  LoginViewViewModel.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMsg: String = ""

    init() {

    }

    // login
    func login() {
        guard validate() else {
            return
        }
        
        // try to sign in
        Auth.auth().signIn(withEmail: email, password: password)
    }

    // validate
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
                
        else {
            errorMsg = "Please fill in all fields"
            return false
        }
        print("login() called")
        
        // validate email
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email"
            return false
        }
        return true
    }
}
