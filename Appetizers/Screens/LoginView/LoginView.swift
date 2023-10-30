//
//  LoginView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 30/10/23.
//

import SwiftUI
//
//struct LoginView: View {
//    @State var username : String = ""
//    var body: some View {
//        VStack{
//            Text("Hello!!")
//                .font(.largeTitle)
//                .bold()
//            TextField("Username", text: $username)
//
//
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}


struct LoginView: View {
    @State var userName: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.system(size: 40, weight: .bold, design: .default))
                .padding()

//            Image("test")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 120, alignment: .center)
//                .clipped()
//                .cornerRadius(60)
//                .padding(.bottom, 20)
            LottieView(lottieFile: "circleAvatar")
            APTextField(text: userName)
            APTextField(text: password)
            APButton(title: "Login")
        }.padding(.bottom, 70)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct APTextField: View {
    @State var text: String
    var body: some View {
        TextField("Enter User Name", text: $text)
            .tint(.brandPrimary)
            .padding()
            .background(Color(uiColor: UIColor(white: 0.1, alpha: 0.1)))
            .cornerRadius(10)
            .frame( height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.leading, 20)
            .padding(.trailing, 20)
    }
}

struct LoginText: View {
    var body: some View {
        Text("Login")
            .padding()
            .font(.system(size: 20, weight: .regular, design: .default))
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
