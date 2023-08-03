//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    // MARK: -  properties
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // MARK: - body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
