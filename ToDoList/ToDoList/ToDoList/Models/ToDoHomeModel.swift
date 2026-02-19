//
//  Model2.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 16/02/2026.
//

import Foundation

struct ToDoHome: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
