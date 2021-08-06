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
        .frame(width: 1300, height: 897, alignment: .leading)
        .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ProductSoldView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldView()
    }
}
