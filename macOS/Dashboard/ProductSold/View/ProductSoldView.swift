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
        }
        .padding(EdgeInsets(top: 45, leading: 12, bottom: 0, trailing: 0))
    }
}

struct ProductSoldView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldView()
    }
}
