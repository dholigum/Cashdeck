//
//  ChooseProductModal.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

struct ChooseProductModal: View {
    
    @ObservedObject var productVM: ProductviewModel
    @ObservedObject var transDetailVM: TransDetailViewModel
    @Binding var chooseProduct: Bool
    var transDetail: TransactionDetailTemp
    
    @State var text: String
    
    init(chooseProductt: Binding<Bool>, transDetaill: TransactionDetailTemp) {
        self.productVM = ProductviewModel()
        self.transDetailVM = TransDetailViewModel()
        self._chooseProduct = chooseProductt
        self.transDetail = transDetaill
        self.text = ""
    }
    
    @State private var isEditing = false
    
    var body: some View {        
        VStack(spacing: 16) {
            HStack {
                Button(action: { chooseProduct = false }, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Sync")
                    .foregroundColor(Color("AccentColor2"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                
                Spacer()
                
                Text("\t\t\t")
                
            } // Sheet Header
            .frame(height: 50)
            .background(Color("AccentColor"))
            
            HStack {
                TextField("Search ...", text: $text)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .font(.title2)
            }
            
            ScrollView {
                ForEach(self.productVM.listProducts, id: \.self) { product in
                    if(text == ""){
                        VStack{
                            Button(action: {
                                transDetailVM.connectProduct(transDetail, product: product)
                                chooseProduct = false
                            }, label: {
                                Text("\(product.name ?? "") - \(product.color ?? "") - \(product.size ?? "")")
                                    .frame(width: 450, height: 25, alignment: .leading)
                                    .font(.title3)
                                    .padding(.top, 10)
                            })
                            .buttonStyle(PlainButtonStyle())
                            Divider()
                        }
                    } else if (text != "" && "\(String(describing: product.name)) - \(String(describing: product.color)) - \(String(describing: product.size))".localizedCaseInsensitiveContains(text)){
                        VStack{
                            Button(action: {
                                transDetailVM.connectProduct(transDetail, product: product)
                                chooseProduct = false
                            }, label: {
                                Text("\(product.name ?? "") - \(product.color ?? "") - \(product.size ?? "")")
                                    .frame(width: 450, height: 25, alignment: .leading)
                                    .font(.title3)
                                    .padding(.top, 10)
                            })
                            .buttonStyle(PlainButtonStyle())
                            Divider()
                        }
                    }
                }
            }
            .background(Color(CGColor.white))
            .padding(10)
            .cornerRadius(50)
            .frame(height: 500)
            
            Spacer()
            
        }
        .frame(width: 500, height: 630)
        .background(Color("MainColor"))
    }
}
