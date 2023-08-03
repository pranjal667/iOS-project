//
//  AddItemView.swift
//  ToDoList
//
//  Created by pranjal on 02/08/2023.
//

import SwiftUI

struct AddItemView: View {
    // MARK: - properties
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter something to be done...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                
                HStack {
                    Button("Save") {
                        saveButtonTapped()
                    }
                    .padding(8)
                    .frame(width: 80, height: 38, alignment: .center)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    .alert(alertTitle, isPresented: $showAlert, actions: {}, message: {Text(alertMessage)})
                    
                    Button("Cancel") {
                        cancelButtonTapped()
                    }
                    .padding(8)
                    .frame(width: 80, height: 38, alignment: .center)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                }
            }.padding(15)
        }
        .navigationTitle("Add an Item 🖋️")
    }
    
    // MARK: - saveButtonTapped
    private func saveButtonTapped() {
        if textValidity() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    // MARK: - presentAlert
    private func presentAlert(title: Text, message: Text) -> Alert {
        return Alert(title: title, message: message)

    }
    
    // MARK: - cancelButtonTapped
    private func cancelButtonTapped() {
        dismiss()
    }
    
    // MARK: - textValidity
    private func textValidity() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "ERROR"
            alertMessage = "Please enter valid item with more than 3 character!!!"
            showAlert.toggle()
//            showAlert(title:  Text("ERROR"), message: Text("Please enter valid item!!!"))
            return false
        } else {
            return true
        }
    }
}

struct AddItem_Previews: PreviewProvider {
    // MARK: - previews
    static var previews: some View {
        NavigationView {
            AddItemView()
        }.environmentObject(ListViewModel())
    }
}
