//
//  Order.swift
//  Appetizers
//
//  Created by Gunin Gupta on 11/10/23.
//

import SwiftUI

final class Order : ObservableObject {
    @Published var items : [Appetizer] = []
    
    var totalPrice : Double {
        items.reduce(0) { $0 + $1.price } 
    }
    
    func addItems(appetizer : Appetizer){
        items.append(appetizer)
    }
    
    func deleteOrder(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
}
