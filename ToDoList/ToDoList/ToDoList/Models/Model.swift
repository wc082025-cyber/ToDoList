//
//  Model.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 16/02/2026.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    var id = UUID() // Default value
    var title: String
    var isCompleted = false
}

struct ToDoCategory: Identifiable, Codable {
    var id = UUID() // Default value
    var title: String
    var items: [ToDoItem] = [] // Default empty list
}
