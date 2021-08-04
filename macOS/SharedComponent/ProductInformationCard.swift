//
//  ProductInformationCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ProductInformationCard: View {
    
    let title: String
    let cashInfo: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(Font.title3.weight(.medium))
            Text(cashInfo)
                .font(Font.system(size: 36).weight(.semibold))
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 185, height: 102)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct ProductInformationCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductInformationCard(title: "Total Product", cashInfo: "20")
    }
}
