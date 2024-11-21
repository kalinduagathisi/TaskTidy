//
//  ToDoListItemsView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListItemViewModel()
    @FirestoreQuery var items: [ToDoListItem]
        
    init (userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                // delete
                                viewModel.deleteItem(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action
                    viewModel.showNewItemView =  true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showNewItemView) {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "8g0JET26n6XYNbZaBzVEUNBi2Ep2")
}
