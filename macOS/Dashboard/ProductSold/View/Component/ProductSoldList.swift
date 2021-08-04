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
            
            HStack {
                Text("SKU")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 150, alignment: .leading)
                
                Text("Name")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 330, alignment: .leading)
                
                Text("Colour")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 105, alignment: .leading)
                
                Text("Size")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 90, alignment: .leading)
                
                Text("Quantity")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 118, alignment: .leading)
                
                Text("Net Income")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 120, alignment: .leading)
            }
            
        }.frame(width: 1009, height: 650.94)
    }
}

struct ProductSoldList_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldList()
    }
}
