//
//  ListViewModel.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    // MARK: - properties
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    @Published var itemKey: String = "itemKey"
    
    // MARK: - initialization
    init() {
        getData()
    }
    
    // MARK: - getData
    func getData() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
            
        self.items = savedItems
    }
    
    // MARK: - deleteItem
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // MARK: - moveItem
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // MARK: - addItem
    func addItem(title: String) {
        let newItem = ItemModel(title: title , isDone: false)
        items.append(newItem)
    }
    
    // MARK: - updateItem
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    // MARK: - saveItems
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
