//
//  ToDoListItem.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
