//
//  ContentView.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 13/02/2026.
//

// ContentView.swift
 import SwiftUI

struct ContentView: View {
    // @state(Object) reference type data model within hierarchy
    // @State is the "managers office" for data. gets data from ToDoStore
    @StateObject private var store = ToDoStore()
    @State private var showingAddCategorySheet = false
    @State private var newCategoryTitle = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.opacity(0.5).ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Organizer List")
                        .font(Font.largeTitle.bold())
                        .frame(width: 350, height: 50)
                        .background(.white.opacity(1.0))
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 10)
                        .padding(.top)

                    // Dynamically generate a link for every category in the store
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(store.categories) { category in
                                NavigationLink(destination: CategoryDetailView(store: store, categoryId: category.id)) {
                                    Text(category.title)
                                        .font(.title2)
                                        .bold()
                                        .frame(width: 300, height: 50)
                                        .background(.white.opacity(1.0))
                                        .cornerRadius(30)
                                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 5)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddCategorySheet = true }) {
                        Image(systemName: "folder.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCategorySheet) {
                NavigationStack {
                    VStack {
                        TextField("New Category Name…", text: $newCategoryTitle)
                            .textFieldStyle(.roundedBorder)
                            .padding()

                        Button("Add Category") {
                            store.addCategory(title: newCategoryTitle)
                            newCategoryTitle = ""
                            showingAddCategorySheet = false
                        }
                        .disabled(newCategoryTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                    .navigationTitle("Add Category")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") { showingAddCategorySheet = false }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
