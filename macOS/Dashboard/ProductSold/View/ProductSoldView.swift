//
//  ProductSoldView.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import SwiftUI

struct ProductSoldView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 24) {
                Text("Best Seller")
                    .font(Font.custom("SFProDisplay-Bold", size: 24))
                    .foregroundColor(Color("AccentColor2"))
                
                HStack (spacing: 24) {
                    TotalNetIncome()
                    TotalSold()
                }
                
                ProductSoldList()
            }
            .frame(width: geometry.frame(in: .global).size.width, height: geometry.frame(in: .global).size.height, alignment: .leading)
            .padding(.leading, 12)
        }
    }
}

struct ProductSoldView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldView()
    }
}
