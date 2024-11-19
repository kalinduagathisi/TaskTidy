//
//  RegisterViewViewModel.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMsg: String = ""

    // register
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserId(id: userId)
        }
    }
    
    private func insertUserId(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }

    // validate
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty,
            !name.trimmingCharacters(in: .whitespaces).isEmpty

        else {

            return false
        }

        // validate email
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email"
            return false
        }

        // validate password
        guard password.count >= 6 else {
            errorMsg = "Password length must be at least 6 characters"
            return false
        }
        return true
    }
}
