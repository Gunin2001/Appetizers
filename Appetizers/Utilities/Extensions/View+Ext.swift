//
//  View+Ext.swift
//  Appetizers
//
//  Created by Gunin Gupta on 31/10/23.
//

import SwiftUI

extension View {
    func placeholder<Content: View>( when shouldShow: Bool,
                                     alignment: Alignment = .leading,
                                     @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
