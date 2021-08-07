//
//  ProductSoldList.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import SwiftUI

struct ProductSoldList: View {
    
    let productSoldVM = ProductSoldViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
                Text("Best Seller")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .padding(EdgeInsets(top: 22, leading: 22, bottom: 24, trailing: 0))
            
                HStack {
                    Text("SKU")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(width: 150, alignment: .leading)
                    
                    Text("Name")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(minWidth: 350, alignment: .leading)
                    
                    Text("Color")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(minWidth: 105, alignment: .leading)
                    
                    Text("Size")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(minWidth: 90, alignment: .leading)
                    
                    Text("Quantity")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(minWidth: 118, alignment: .leading)
                    
                    Text("Net Income")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(minWidth: 120, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 16, trailing: 0))
            ScrollView {
                ForEach(self.productSoldVM.productSold, id: \.self) { data in
                    VStack (alignment: .leading){
                        HStack {
                            Text(data.sku)
                                    .frame(width: 150, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text(data.name)
                                    .frame(minWidth: 350, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text(data.color)
                                    .frame(minWidth: 105, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text(data.size)
                                    .frame(minWidth: 90, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                Text("\(data.quantity)")
                                    .frame(minWidth: 118, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                            Text("+Rp \(data.netIncome)")
                                    .frame(minWidth: 120, alignment: .leading)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                        }
                        line
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0))
        }
        .frame(minWidth: 1009, maxWidth: 1009, minHeight: 650.94, maxHeight: 700)
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
    }
}

var line: some View {
    VStack {
        Divider()
            .frame(width: 970)
            .background(Color("DividerColor"))
    }
    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
}

struct ProductSoldList_Previews: PreviewProvider {
    static var previews: some View {
        ProductSoldList()
    }
}
