//
//  ProductTable.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 11/08/21.
//

import SwiftUI

struct ProductTable: View {
    
    @StateObject var ProductsVM = ProductViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("All Product")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .padding()
                    .foregroundColor(Color("AccentColor2"))
                Spacer()
            }
            HStack {
                Text("SKU")
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .padding(10)
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
            }.padding(.leading, 10)
            
            CustomDivider(width: 960)
                .padding(EdgeInsets(top: -8, leading: -8, bottom: 0, trailing: 0))
            
            ScrollView {
                if self.ProductsVM.listProducts.count > 0 {
                    ForEach(self.ProductsVM.listProducts) { product in
                        VStack {
                            HStack {
                                Text(product.sku!)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                                    .frame(width: 120, alignment: .leading)
                                Text(product.name!)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .frame(width: 350, alignment: .leading)
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                                Text(product.size!)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .frame(width: 30, alignment: .leading)
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                                Text(product.color!)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .frame(width: 60, alignment: .leading)
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                                Text(String(product.quantity))
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .frame(width: 70, alignment: .leading)
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
                                Text("\(product.costPrice)")
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .frame(width: 100, alignment: .leading)
                                    .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
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
                            .padding(.leading, -6)
                            CustomDivider(width: 960)

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
