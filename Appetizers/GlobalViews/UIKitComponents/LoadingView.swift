//
//  LoadingView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 09/10/23.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView : View{
    
    var body: some View{
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
