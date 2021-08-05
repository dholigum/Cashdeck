//
//  ProductSoldView.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import SwiftUI

struct ProductSoldView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 24) {
            Text("Product Sold")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .foregroundColor(Color("AccentColor2"))
            
            HStack (spacing: 24) {
                TotalNetIncome()
                TotalSold()
            }
            
            ProductSoldList()
        }
        .padding(EdgeInsets(top: 45, leading: -300, bottom: 0, trailing: 0))
//        .padding(EdgeInsets(top: 45, leading: 12, bottom: 0, trailing: 0))
//        .frame(minWidth: 1009, maxWidth: 1009, minHeight: 650.94, maxHeight: 700, alignment: .leading)
    }
}

struct ProductSoldView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldView()
    }
}
