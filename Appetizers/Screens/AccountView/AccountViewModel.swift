//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gunin Gupta on 10/10/23.
//

import Foundation

final class AccountViewModel : ObservableObject{
    
    @Published var firstName = ""
    @Published var secondName = ""
    @Published var email = ""
    @Published var date = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem : AlertItem?

    var isValidForm : Bool{
        guard !firstName.isEmpty && !secondName.isEmpty && !email.isEmpty else{
            
            return false
        }
        guard email.isValidEmail else{
            return false
        }
        
        return true
    }
}
