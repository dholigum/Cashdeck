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
        VStack (spacing: 20) {
            GeometryReader { geometry in
                Text("Best Seller")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .frame(width: geometry.frame(in: .local).size.width, alignment: .leading)
                    .padding(.leading, 25)
            }
            .frame(height: 24)
            .padding(.top, 20)
            
            
            
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
            
            ScrollView {
                ForEach(self.productSoldVM.productSold, id: \.self) { data in
                    VStack {
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
                                    .frame(minWidth: 30, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                        }
                        line
                    }
                }
            }
        }
        .frame(width: 490, height: 380)
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct ProductSoldCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldCard()
    }
}
