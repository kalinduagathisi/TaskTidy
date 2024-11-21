//
//  ToDoListItemsView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListItemViewModel()
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
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
    ToDoListView(userId: "")
}
