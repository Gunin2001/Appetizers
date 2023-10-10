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
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Second Name", text: $viewModel.secondName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday", selection: $viewModel.date,displayedComponents: .date)
                    Button {
                        
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Information")
                }
                
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                }
            header: {
                    Text("Requests")
                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))


            }.navigationTitle("Accounts")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
