//
//  ListView.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import SwiftUI

struct ListView: View {
    // MARK: - properties
    @EnvironmentObject var listViewModel: ListViewModel
    
    // MARK: - body
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listViewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }   .navigationTitle("TODO LIST 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddItemView()
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    // MARK: - previews
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}

