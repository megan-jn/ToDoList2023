//
//  ToDoItem.swift
//  ToDoList2023
//
//  Created by Megan on 5/15/23.
//

import Foundation

class ToDoItem: Identifiable {
    var id = UUID()
    
    var title = ""
    var isImportant = false
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
    }
}
