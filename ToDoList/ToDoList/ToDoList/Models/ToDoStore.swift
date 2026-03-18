//
//  ToDoStore.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 19/02/2026.
//

import Foundation
import Combine
import SwiftUI 
/*
@ObserableObject is the owner. Tells other files it is watchable. @Obserable means "broadcasting tower" and has data other classes may want to watch
 final (no copy rule) means no other class can inherit from. this is the final version of this blueprint,

 ToDoStore: Obserableobject is like a radio station. broadcasting its code
 @StateObject is the station manager who builds the station and turns on power
 @observedObject is the listener
 */
final class ToDoStore: ObservableObject {
    @Published var categories: [ToDoCategory] = [] {
        didSet { save() }
    }
    
    private let storageKey = "unified_todo_categories"
    
    init() {
        load()
        // If empty, add the default starting categories
        if categories.isEmpty {
            categories.append(ToDoCategory(title: "ToDo Home"))
            categories.append(ToDoCategory(title: "ToDo Work"))
        }
    }
    
    // MARK: - Category Add
    func addCategory(title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        // Swift automatically uses UUID() for the id
        categories.append(ToDoCategory(title: title))
    }
    // delete category

    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }

    // MARK: - Add task
    func addTask(to categoryId: UUID, title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        if let index = categories.firstIndex(where: { $0.id == categoryId }) {
            categories[index].items.append(ToDoItem(title: title))
        }
    }

    func toggleCompletion(categoryId: UUID, item: ToDoItem) {
        if let catIndex = categories.firstIndex(where: { $0.id == categoryId }),
           let itemIndex = categories[catIndex].items.firstIndex(where: { $0.id == item.id }) {
            categories[catIndex].items[itemIndex].isCompleted.toggle()
        }
    }
//delete task
    func deleteItem(from categoryId: UUID, at offsets: IndexSet) {
        if let index = categories.firstIndex(where: { $0.id == categoryId }) {
            categories[index].items.remove(atOffsets: offsets)
        }
    }
    
    //MARK: move task
    
    func moveItem(from categoryId: UUID, source: IndexSet, destination: Int) {
        if let index = categories.firstIndex(where: { $0.id == categoryId }) {
            // We use both the source offsets and the destination index
            categories[index].items.move(fromOffsets: source, toOffset: destination)
        }
    }
    
  

    // MARK: - Save
    private func save() {
        if let data = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([ToDoCategory].self, from: data) {
            categories = saved
        }
    }
}
