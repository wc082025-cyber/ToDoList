//
//  List.swift
//  ToDoList
//
//  Created by Chris Wahlberg on 13/02/2026.
//

import Foundation

struct List: View {
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.mint.opacity(0.5)
                    .ignoresSafeArea()
                VStack{
                    Text("ToDo")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(.white)
                       .cornerRadius(30)
                        
                        .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 5)
                    
                    
                    
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    List()
}
