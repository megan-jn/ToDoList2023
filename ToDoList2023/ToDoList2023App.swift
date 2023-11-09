//
//  ToDoList2023App.swift
//  ToDoList2023
//
//  Created by Megan on 5/15/23.
//

import SwiftUI

@main
struct ToDoList2023App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
