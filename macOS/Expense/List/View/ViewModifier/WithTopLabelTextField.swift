//
//  WithTopLabelTextField.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import SwiftUI

struct WithTopLabelTextField: ViewModifier {
    
    let labelName: String
    let isWithCurrency: Bool
    
    public func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            Text(labelName)
                .padding(.leading)
                .foregroundColor(Color("AccentColor2"))
                .font(Font.title3.weight(.medium))
                .padding(.vertical, -4)
            
            if isWithCurrency {
                content
                    .modifier(WithCurrencyLabel(currecy: "Rp"))
                    .padding(.leading)
            } else {
                content
                    .padding(.leading)
            }
        }
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(8)
        .clipped()
        .padding(.horizontal)
    }
}
