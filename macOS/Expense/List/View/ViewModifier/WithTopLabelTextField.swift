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
                .padding(.leading, 8)
                .foregroundColor(Color("AccentColor2"))
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .padding(.vertical, -4)
            
            if isWithCurrency {
                content
                    .modifier(WithCurrencyLabel(currecy: "Rp"))
                    .padding(.horizontal, 8)
            } else {
                content
                    .padding(.horizontal, 8)
            }
        }
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(8)
        .clipped()
        .padding(.horizontal)
    }
}
