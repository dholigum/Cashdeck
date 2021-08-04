//
//  WithCurrencyLabel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import SwiftUI

struct WithCurrencyLabel: ViewModifier {
    
    let currecy: String
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom) {
            Text(currecy)
                .foregroundColor(Color("OrangeColor"))
                .font(Font.custom("SFProDisplay-Semibold", size: 24))
            content
        }
    }
}
