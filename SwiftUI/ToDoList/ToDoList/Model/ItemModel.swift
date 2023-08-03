//
//  Item.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    // MARK: -  properties
    let id: String
    let title: String
    let isDone: Bool
    
    // MARK: - initialization
    init(id: String = UUID().uuidString ,title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    // MARK: - updateCompletion
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isDone: !isDone)
    }
}
