//
//  LoginView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {

                // header
                HeaderView(
                    title: "TaskTidy",
                    subtitle: "Arrange your tasks",
                    angle: 15,
                    background: .pink
                )

                // login form
                Form {

                    // error msg
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(.red)
                    }

                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    // button
                    TLButton(
                        title: "Log In",
                        backgroundColor: .blue
                    ) {
                        // action
                        viewModel.login()
                    }

                }

                // create account
                VStack {
                    Text("New around here?")

                    NavigationLink(
                        "Create new account", destination: RegisterView())
                }
                .padding(.bottom, 50)

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
