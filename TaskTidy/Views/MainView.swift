//
//  ContentView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-17.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            ToDoListView()
        } else {
            LoginView()
        }

    }
}

#Preview {
    MainView()
}
