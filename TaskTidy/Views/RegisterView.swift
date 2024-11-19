//
//  RegisterView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            
            // header
            HeaderView(title: "Register",
                       subtitle: "Start organizing your tasks",
                       angle: -15,
                       background: .yellow)
            
            // register form
            Form {
                
                // error msg
                if !viewModel.errorMsg.isEmpty {
                    Text(viewModel.errorMsg)
                        .foregroundColor(.red)
                }
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // button
                TLButton(
                    title: "Register",
                    backgroundColor: .green
                ) {
                    // action
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
