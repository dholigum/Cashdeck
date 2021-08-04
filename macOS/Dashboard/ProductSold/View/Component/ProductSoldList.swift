//
//  ProductSoldList.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import SwiftUI

struct ProductSoldList: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Best Seller")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(Color("AccentColor2"))
            
            HStack (spacing: 100) {
                Text("SKU")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                Text("Name")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                Text("Colour")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                Text("Size")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                Text("Quantity")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                Text("Net Income")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
            }
        }.frame(width: 1009, height: 650.94)
    }
}

struct ProductSoldList_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldList()
    }
}
