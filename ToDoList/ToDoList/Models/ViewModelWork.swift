//
//  ViewModelWork.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 16/02/2026.
//
/*
import Foundation
import Combine
 import SwiftUI

/// ObservableObject that owns the list of todos and handles persistence.
final class ToDoStoreWork: ObservableObject {
    @Published var items: [ToDoWork] = [] {
        didSet { save() }               // Save whenever the array changes
    }

    private let storageKey2 = "todo_work"

    init() {
        load()
    }

    // MARK: - CRUD helpers

    func add(title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        items.append(ToDoWork(title: title))
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    func toggleCompletion(of item: ToDoWork) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }

    // MARK: - Persistence (UserDefaults)

    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: storageKey2)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey2),
           let saved = try? JSONDecoder().decode([ToDoWork].self, from: data) {
            items = saved
        }
    }
}
*/
