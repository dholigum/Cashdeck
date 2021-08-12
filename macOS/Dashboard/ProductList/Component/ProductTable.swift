//
//  ProductTable.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 11/08/21.
//

import SwiftUI

struct ProductTable: View {
    @ObservedObject var ProductsVM: ProductViewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("All Product")
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundColor(Color("AccentColor2"))
                Spacer()
            }
            HStack {
                Text("SKU")
                    .fontWeight(.semibold)
                    .padding(20)
                    .frame(width: 120, alignment: .leading)
                Text("Name")
                    .fontWeight(.semibold)
                    .frame(width: 300, alignment: .leading)
                    .padding(20)
                Text("Cost Price")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Text("Size")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Text("Color")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Spacer()
            }
            ScrollView {
                if self.ProductsVM.listProducts.count > 0 {
                    ForEach(self.ProductsVM.listProducts) { product in
                        HStack {
                            Text(product.sku!)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                                .frame(width: 120, alignment: .leading)
                            Text(product.name!)
                                .frame(width: 300, alignment: .leading)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                            Text("\(product.costPrice)")
                                .frame(width: 100, alignment: .leading)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                            Text(product.size!)
                                .frame(width: 100, alignment: .leading)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                            Text(product.color!)
                                .frame(width: 100, alignment: .leading)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                            Button(action: {}) {
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(Color("AccentColor2"))
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.trailing, 20)
                            Button(action: {}) {
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(Color.orange)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.trailing, 35)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding()
        .onAppear(perform: fetchProduct)
    }
}

extension ProductTable {
    func fetchProduct() {
        ProductsVM.fetchProducts()
    }
}
