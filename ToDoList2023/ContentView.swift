//
//  ContentView.swift
//  ToDoList2023
//
//  Created by Megan on 5/15/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    var toDoItems: FetchedResults<ToDo>
    @State private var showNewTask = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("To Do List")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                    Spacer()
                    Button(action: {
                        self.showNewTask = true
                    }) {
                        Text("+")
                            .font(Font.custom("Montserrat-Bold", size: 26))
                        
                    }
                    .tint(.orange)
                }
                .padding()
                Spacer()
                
                List {
                    ForEach (toDoItems) { toDoItem in
                        if toDoItem.isImportant == true {
                            Text("⚡️" + (toDoItem.title ?? "No title"))
                        } else {
                            Text(toDoItem.title ?? "No title")
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                
//                NavigationLink(destination: ArchiveView(toDoItems: .constant([]))) {
//                    Text("Archive")
//                }
            }
        }
            if showNewTask {
                NewToDoView(toDoItems: .constant([]), showNewTask: $showNewTask, title: "", isImportant: false)
            }
        }
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
