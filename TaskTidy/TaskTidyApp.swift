//
//  TaskTidyApp.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-17.
//

import FirebaseCore
import SwiftUI

@main
struct TaskTidyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
