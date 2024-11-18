//
//  HeaderView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle.degrees(15))
            
            VStack {
                Text("TaskTidy")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                Text("Arrange your tasks")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
