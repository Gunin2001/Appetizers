//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gunin Gupta on 10/10/23.
//

import SwiftUI

final class AccountViewModel : ObservableObject{
    @AppStorage("user") private var userData : Data? // don't save user in userdefaults
    
    @Published var user = User()
    @Published var alertItem : AlertItem?

    var isValidForm : Bool{
        guard !user.firstName.isEmpty && !user.secondName.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else{ return }
        print("changes made")
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData = userData else{ return }
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
}
