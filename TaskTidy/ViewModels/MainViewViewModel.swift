//
//  MainViewViewModel.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
