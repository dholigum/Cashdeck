//
//  ProductTable.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 11/08/21.
//

import SwiftUI

struct ProductTable: View {
    
    @StateObject var ProductsVM = ProductViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("All Product")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .padding(EdgeInsets(top: 22.06, leading: 52, bottom: 24, trailing: 0))
                    .foregroundColor(Color("AccentColor2"))
                Spacer()
            }
            HStack {
                Text("SKU")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 120, alignment: .leading)
                Text("Name")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 350, alignment: .leading)
                    .padding(10)
                Text("Size")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 30, alignment: .leading)
                    .padding(10)
                Text("Color")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 60, alignment: .leading)
                    .padding(10)
                Text("Quantity")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 70, alignment: .leading)
                    .padding(10)
                Text("Cost Price")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 100, alignment: .leading)
                    .padding(10)
                Spacer()
            }.padding(.leading, 52)
            
                ScrollView {
                    if self.ProductsVM.listProducts.count > 0 {
                        ForEach(self.ProductsVM.listProducts) { product in
                            VStack (alignment: .leading) {
                                HStack {
                                    Text(product.sku!)
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 130, alignment: .leading)
                                    Text(product.name!)
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 375, alignment: .leading)
                                    Text(product.size!)
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 50, alignment: .leading)
                                    Text(product.color!)
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 80, alignment: .leading)
                                    Text(String(product.quantity))
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 90, alignment: .leading)
                                    Text("\(product.costPrice)")
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                        .frame(minWidth: 100, alignment: .leading)
                                    Button(action: {
                                        ProductsVM.deleteProduct(product)
                                    }) {
                                        Image(systemName: "trash.fill")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                            .foregroundColor(Color.orange)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(.trailing, 35)
                                    
                                }
                                line
                            }
                        }
                        
                    } else {
                        VStack(alignment: .center) {
                            
                            Image("noProductListIllustration")
                                .resizable()
                                .frame(width: 356, height: 272)
                                .aspectRatio(contentMode: .fill)
                            
                            Text("You have no expenses yet.")
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AccentColor2"))
                        }
                        .padding(.top, 36)
                    }
                }
                .padding(.leading, 52)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding(10)
        .onAppear(perform: fetchProduct)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

extension ProductTable {
    func fetchProduct() {
        ProductsVM.fetchProducts()
    }
}
