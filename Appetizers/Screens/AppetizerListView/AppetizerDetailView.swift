//
//  DetailView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 10/10/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    var body: some View {
        VStack(spacing: 10){
            ZStack(alignment: .topLeading) {
                Image("test")
                    .resizable()
                .frame(width: .infinity,height: 150)
            .aspectRatio(contentMode: .fit)
                HStack{
                    Spacer()
                    Label {
                        Text("")
                    } icon: {
                        Image(systemName: "cross")
                            .background {
                                Color.white
                            }
                            .cornerRadius(10)
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                }
            }
            
            Text("Chicken Wings")
                .font(.title2)
                .fontWeight(.medium)
            
            Text("You'll need extra napkins with these tasty treats.")
                .font(.body)
                .foregroundColor(.gray)
            HStack(spacing: 20){
                VStack{
                    Text("Calories")
                    Text("700")
                }.padding()
                VStack{
                    Text("Calories")
                    Text("700")
                }.padding()
                VStack{
                    Text("Calories")
                    Text("700")
                }.padding()
            }
            Button {
                
            } label: {
                Text("$11.49 - Add To Order")
                    .foregroundColor(.white)
                    .frame(width: 200,height: 40)
                    .background {
                        Color.brandPrimary
                    }
                    .cornerRadius(15)
            }

        }.cornerRadius(10)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView()
    }
}
