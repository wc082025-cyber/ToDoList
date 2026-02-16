//
//  List.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 13/02/2026.
//
import SwiftUI

struct ListView: View {
    @StateObject private var store = ToDoStoreHome()
    @State private var showingAddSheet = false
    @State private var newTitle = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.mint.opacity(0.5)
                    .ignoresSafeArea()
                VStack{
                    Text("ToDo Home")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(.white)
                       .cornerRadius(30)
                        
                        .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 5)
                    
                    
                        .padding()
                    
                    Spacer()
                    
                    List {
                        ForEach(store.items) { item in
                            HStack {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture { store.toggleCompletion(of: item) }

                                Text(item.title)
                                    .strikethrough(item.isCompleted, color: .secondary)
                                    .foregroundColor(item.isCompleted ? .secondary : .primary)
                            }
                        }
                        .onDelete(perform: store.delete)
                        .onMove(perform: store.move)
                    }
                    .listStyle(.sidebar)
                    .scrollContentBackground(.hidden)
                    
                }
           
            }
          
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()                 // Enables swipe‑to‑delete & reordering
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                NavigationStack {
                    VStack {
                        TextField("New task…", text: $newTitle)
                            .textFieldStyle(.roundedBorder)
                            .padding()

                        Button("Add") {
                            store.add(title: newTitle)
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
}

#Preview {
    ListView()
}
