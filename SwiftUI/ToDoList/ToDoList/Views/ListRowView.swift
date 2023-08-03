//
//  ListRowView.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import SwiftUI

struct ListRowView: View {
    // MARK: - viewProperties
    var item: ItemModel

    // MARK: - body
    var body: some View {
        HStack {
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(item.isDone ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}

struct ListRowView_Previews: PreviewProvider {
    // MARK: - previewProperties
    static var item1 = ItemModel(title: "task1", isDone: true)
    static var item2 = ItemModel(title: "task2", isDone: false)
    
    // MARK: - previews
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
