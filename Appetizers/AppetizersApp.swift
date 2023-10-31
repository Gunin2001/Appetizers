//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Gunin Gupta on 04/10/23.
//

import SwiftUI
import Firebase
@main
struct AppetizersApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
