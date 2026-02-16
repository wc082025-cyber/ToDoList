//
//  ContentView.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 13/02/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = ToDoStore()
    @State private var showingAddSheet = false
    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.opacity(0.5).ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    Text("Listening List")
                        .font(Font.largeTitle.bold())
                        .frame(width: 350, height: 50)
                        .background(.white.opacity(1.0))
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 10)
                    
                    Spacer()
                    
                    // ToDo Home
                    NavigationLink(destination: ListView()) {
                        Text("ToDo Home")
                            .font(.largeTitle)
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(.white.opacity(1.0))
                            .cornerRadius(30)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 10)
                    }
                    
                    
                    //ToDo Work
                    NavigationLink(destination: ListView2()) {
                        Text("ToDo Work")
                            .font(.largeTitle)
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(.white.opacity(1.0))
                            .cornerRadius(30)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 10)
                    }
                    
                    
                    //MARK: The To‑Do list
             /*       List {
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
                    
*/
                    Spacer()
                } // VStack
                .padding()
            } // ZStack
          /*
           
           //MARK: The edit and plus button
           
           .navigationTitle("")
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
           */
           
          /*  .sheet(isPresented: $showingAddSheet) {
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
            } // sheet is presented
           
           */
           
        } // NavigationStack
    }
}
#Preview {
    ContentView()
}
