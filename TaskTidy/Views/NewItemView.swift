//
//  NewItemView.swift
//  TaskTidy
//
//  Created by Kalindu Agathisi on 2024-11-18.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {

        VStack {
            Text("New Task")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100) 
            
            // form
            Form {
                
                // title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // button
                TLButton(title: "Save",
                         backgroundColor: .pink
                ) {
                    // action
                    
                    if(viewModel.canSave) {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select a due date newer than today."))
            }
        }

    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
