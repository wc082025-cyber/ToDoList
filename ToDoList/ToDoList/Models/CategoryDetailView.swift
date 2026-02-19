//
//  CategoryDetailView.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 19/02/2026.
//

// CategoryDetailView.swift
 import SwiftUI

struct CategoryDetailView: View {
    @ObservedObject var store: ToDoStore
    var categoryId: UUID
    
    @State private var showingAddSheet = false
    @State private var newTitle = ""
    
    // Helper to easily get the current category
    private var category: ToDoCategory? {
        store.categories.first { $0.id == categoryId }
    }
    
    var body: some View {
        ZStack {
            Color.mint.opacity(0.5).ignoresSafeArea()
            
            if let category = category {
                VStack {
                    Text(category.title)
                        .font(Font.largeTitle.bold())
                        .frame(width: 300, height: 50)
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 5)
                                                .padding(.top, 20)
                    List {
                        ForEach(category.items) { item in
                            HStack {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture { store.toggleCompletion(categoryId: category.id, item: item) }
                                
                                Text(item.title)
                                    .strikethrough(item.isCompleted, color: .secondary)
                                    .foregroundColor(item.isCompleted ? .secondary : .primary)
                            }
                        }
                        .onDelete { offsets in store.deleteItem(from: category.id, at: offsets) }
                        // test to see if move works
                        
                        .onMove { offsets, destination in
                            store.moveItem(from: category.id, source: offsets, destination: destination)
                        }
                        
                        // end move test
                    }
                    .listStyle(.sidebar)
                    .scrollContentBackground(.hidden)
                }
            } else {
                Text("Category not found")
            }
        }
        .navigationTitle(category?.title ?? "Tasks")
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddSheet = true }) { Image(systemName: "plus") }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            NavigationStack {
                VStack {
                    TextField("New task…", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button("Add") {
                        store.addTask(to: categoryId, title: newTitle)
                        newTitle = ""
                        showingAddSheet = false
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .navigationTitle("Add Task")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { showingAddSheet = false }
                    }
                }
            }
        }
    }
}
