//
//  LoginView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct LoginView: View {

    @State var email: String = ""
    @State var password: String = ""

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
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    // button
                    TLButton(
                        title: "Log In",
                        backgroundColor: .blue
                    ) {
                        // action
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
