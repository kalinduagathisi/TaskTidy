//
//  ToDoListItemView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.subheadline)
                Text(
                    "\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))"
                )
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))

            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(id: item.id)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        item: ToDoListItem(
            id: "123",
            title: "Get water",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true))
}
