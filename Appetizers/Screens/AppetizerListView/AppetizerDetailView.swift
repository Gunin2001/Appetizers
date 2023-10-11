//
//  DetailView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 10/10/23.
//

//import SwiftUI
//
//struct AppetizerDetailView: View {
//    let appetizer : Appetizer
//    var body: some View {
//        VStack(spacing: 10){
//            ZStack(alignment: .topLeading) {
//                Image("test")
//                    .resizable()
//                .frame(width: 320,height: 150)
//            .aspectRatio(contentMode: .fill)
//                HStack{
//                    Spacer()
//                    Label {
//                        Text("")
//                    } icon: {
//                        Image(systemName: "cross")
//                            .background {
//                                Color.white
//                            }
//                            .cornerRadius(10)
//                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
//
//                }
//            }
//            Spacer()
//            Text("Chicken Wings")
//                .font(.title2)
//                .fontWeight(.medium)
//
//            Text("You'll need extra napkins with these tasty treats.")
//                .font(.body)
//                .foregroundColor(.gray)
//            HStack(spacing: 10){
//                VStack{
//                    Text("Calories")
//                    Text("700")
//                }.padding()
//                VStack{
//                    Text("Calories")
//                    Text("700")
//                }.padding()
//                VStack{
//                    Text("Calories")
//                    Text("700")
//                }.padding()
//            }
//            Spacer()
//            Button {
//
//            } label: {
//                Text("$11.49 - Add To Order")
//                    .foregroundColor(.white)
//                    .frame(width: 200,height: 40)
//                    .background {
//                        Color.brandPrimary
//                    }
//                    .cornerRadius(15)
//            }.padding()
//
//        }
//        .frame(width: 320, height: 525)
//        .background(Color(.systemBackground))
//        .cornerRadius(10)
//        .shadow(radius: 40)
//
//    }
//}
//
//struct AppetizerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppetizerDetailView(appetizer: MockData.sampleAppetizer)
//    }
//}

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order : Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                isShowingDetail = false
                order.addItems(appetizer: appetizer)
                print(order)
            } label: {
               APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
    }
}


struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
