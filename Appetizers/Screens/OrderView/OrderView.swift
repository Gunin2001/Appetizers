//
//  OrderView.swift
//  Appetizers
//
//  Created by Gunin Gupta on 04/10/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            order.deleteOrder(indexSet: indexSet)
                        }
                    }.listStyle(.plain)
                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.totalPrice,specifier: "%.2f") - Add to Order")
                    }.padding(.bottom,20)
                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-state", message: "You have no orders in your order list. Please add an appetizer")
                }
            }.navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
