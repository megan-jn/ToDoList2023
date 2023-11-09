//
//  NewToDoView.swift
//  ToDoList2023
//
//  Created by Megan on 5/15/23.
//

import SwiftUI

struct NewToDoView: View {
    @Binding var toDoItems: [ToDoItem]
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    
    @State var title: String
    @State var isImportant: Bool
    var body: some View {
        VStack {
            Text("Add a new task")
                .font(Font.custom("Montserrat-Bold", size: 26))
                .fontWeight(.bold)
            
            TextField("Enter the task description", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $isImportant) {
                            Text("Is it important?")
                    .font(Font.custom("Montserrat-Medium", size: 24))
            }
            .padding()
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            Button(action: {
                self.addTask()
                self.showNewTask = false
            }) {
                Text("ADD")
                    .font(Font.custom("Montserrat-Medium", size: 22))
            }
            .tint(.orange)
            .padding()
        }
    }
    private func addTask() {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(toDoItems: .constant([]), showNewTask: .constant(true), title: "", isImportant: false)
    }
}
