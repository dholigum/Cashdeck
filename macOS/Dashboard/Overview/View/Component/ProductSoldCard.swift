//
//  ProductSoldView.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ProductSoldCard: View {
    var body: some View {
        VStack {
            Text("ProductSoldCard")
                .font(Font.title.weight(.semibold))
                .padding(.vertical)
                .foregroundColor(Color("AccentColor2"))
                .padding(.top, 4)
                .padding(.leading, 20)
        }
        .frame(width: 500, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
    }
}

struct ProductSoldCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldCard()
    }
}
