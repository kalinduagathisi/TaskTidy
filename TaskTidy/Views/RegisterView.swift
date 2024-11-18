//
//  RegisterView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing your tasks",
                       angle: -15,
                       background: .yellow)
        }
    }
}

#Preview {
    RegisterView()
}
