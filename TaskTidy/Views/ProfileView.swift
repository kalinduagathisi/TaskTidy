//
//  ProfileView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {

                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }

            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }

    }
     
    @ViewBuilder
    func profile(user: User) -> some View{
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: ContentMode.fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()

        // info: email/ name/ member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since")
                    .bold()
                Text(
                    "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))"
                )
            }
            .padding()
        }
        .padding()

        // sign out
        Button("Sign Out") {
            viewModel.signOut()
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
        .padding()

        Spacer()
    }
}

#Preview {
    ProfileView()
}
