//
//  AccountView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 04/10/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Second Name", text: $viewModel.user.secondName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday", selection: $viewModel.user.date,displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Information")
                }
                
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
            header: {
                    Text("Requests")
                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))


            }.navigationTitle("Accounts")
        }.alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton)
        }
        .onAppear{
            viewModel.retrieveUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
