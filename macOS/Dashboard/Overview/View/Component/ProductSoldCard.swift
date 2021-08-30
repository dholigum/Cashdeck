//
//  ProductSoldView.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ProductSoldCard: View {
    let productSoldVM = ProductSoldViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Best Seller")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(Color("AccentColor2"))
                .frame(height: 24)
                .padding(.top, 20)
                .padding(.leading, 25)
            
            HStack {
                Text("SKU")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .frame(width: 100, alignment: .leading)
                
                Text("Quantity")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .frame(minWidth: 72, alignment: .leading)
                
                Text("Color")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .frame(minWidth: 82, alignment: .leading)
                
                Text("Size")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .frame(minWidth: 77, alignment: .leading)
                
                Text("Net Income")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .frame(minWidth: 30, alignment: .leading)
            }
            .padding(.leading, 25)
            
            ScrollView {
                ForEach(self.productSoldVM.productSold, id: \.self) { data in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(data.sku)
                                .padding(.leading, -1)
                                .frame(minWidth: 105, alignment: .leading)
                                .font(Font.custom("SFProDisplay-Regular", size: 12))
                            Text("\(data.quantity)")
                                .frame(minWidth: 65, alignment: .leading)
                                .font(Font.custom("SFProDisplay-Regular", size: 12))
                            Text(data.color)
                                .frame(minWidth: 82, alignment: .leading)
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text(data.size)
                                .frame(minWidth: 65, alignment: .leading)
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text("+Rp \(data.netIncome)")
                                .frame(width: 110, alignment: .leading)
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                        }
                        .padding(.leading, 25)
                        line
                            .frame(maxWidth: 300)
                    }
                }
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .padding(.bottom, 16)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct ProductSoldCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldCard()
    }
}
