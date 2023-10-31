//
//  LoginView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 30/10/23.
//

import SwiftUI
import Firebase
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn : Bool = true
    var order = Order()
    var body: some View {
        if userIsLoggedIn{
            AppetizerTabView()
                .environmentObject(order)
        }
        else{
            loginView
        }
    }
    var loginView : some View{
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient (colors: [.green,.brandPrimary], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame (width: 1000, height: 600)
                .rotationEffect(.degrees (135))
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .bold()
                    .font(.system(size: 48))
                
                LottieView(lottieFile: "circleAvatar",loopMode: .loop)
                    .frame(width: .infinity,height: 220)
                
                APTextField(text: $email, placeholderText: "Enter email")
                    .textInputAutocapitalization(.never)
                APSecureTextField(text: $password, placeholderText: "Enter password")
                Button {
                    login()
                } label: {
                    APButton(title: "Login")
                }
                
                HStack{
                    Text("Already Registered?")
                        .font(.headline)
                        .foregroundColor(.white)
                    Button{
                        
                    } label: {
                        Text("SignUp")
                            .bold()
                            .font(.headline)
                            .foregroundColor(.black)
                            .underline(true)
                    }
                    
                }

            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil{
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }.ignoresSafeArea()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print (error!.localizedDescription)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct APTextField: View {
    @Binding var text: String
    @State var placeholderText : String 
    var body: some View {
        TextField("", text: $text)
            .padding()
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .frame( width: .infinity, height: 60)
            .overlay(alignment: .leading){
                Text(text.isEmpty ? placeholderText : "")
                    .foregroundColor(Color(white: 1, opacity: 0.5))
                    .padding(.leading,15)
            }
    }
}

struct APSecureTextField: View {
    @Binding var text: String
    @State var placeholderText : String
    var body: some View {
        SecureField("", text: $text)
            .padding()
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .frame( width: .infinity, height: 60)
            .overlay(alignment: .leading){
                Text(text.isEmpty ? placeholderText : "")
                    .foregroundColor(Color(white: 1, opacity: 0.5))
                    .padding(.leading,15)
            }
    }
}
