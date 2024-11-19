//
//  User.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval 
}
