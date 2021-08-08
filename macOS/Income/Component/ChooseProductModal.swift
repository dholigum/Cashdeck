//
//  ChooseProductModal.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

struct ChooseProductModal: View {
    
    @ObservedObject var productVM: ProductviewModel
    @Binding var chooseProduct: Bool
    
    @State var text: String
    
    init(chooseProductt: Binding<Bool>) {
        self.productVM = ProductviewModel()
        self._chooseProduct = chooseProductt
        self.text = ""
    }
    
    let namess = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh", "iii", "jjj", "kkk", "lll", "mmm", "nnn", "ooo"]
    
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
                
                Button(action: {
                }, label: {
                    Text("Save")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
            } // Sheet Header
            .frame(width: .infinity, height: 50)
            .background(Color("AccentColor"))
            
            HStack {
                TextField("Search ...", text: $text)
                    .background(Color("systemGray6"))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .font(.title2)
            }
            
//            List(names) {
//                Text($0.name)
//            }
            
            ScrollView {
//                ForEach(namess, id: \.self) { row in
//                    if(text == ""){
//                        VStack {
//                            Text(row)
//                                .frame(width: 450, height: 25, alignment: .leading)
//                                .font(.title2)
//                                .padding(.top, 10)
//                            Divider()
//                        }
//                        .background(Color(CGColor.white))
//                    } else if (text != "" && "\(row)".contains(text)) {
//                        VStack {
//                            Text(row)
//                                .frame(width: 450, height: 25, alignment: .leading)
//                                .font(.title2)
//                                .padding(.top, 10)
//                            Divider()
//                        }
//                        .background(Color(CGColor.white))
//                    }
                
                    ForEach(self.productVM.listProducts, id: \.self) { product in
                        if(text == ""){
                            VStack{
                                Text("\(product.name ?? "") - \(product.color ?? "") - \(product.size ?? "")")
                                    .frame(width: 450, height: 25, alignment: .leading)
                                    .font(.title3)
                                    .padding(.top, 10)
                                Divider()
                            }
                        } else if (text != "" && "\(String(describing: product.name)) - \(String(describing: product.color)) - \(String(describing: product.size))".localizedCaseInsensitiveContains(text)){
                            VStack{
                                Text("\(product.name ?? "") - \(product.color ?? "") - \(product.size ?? "")")
                                    .frame(width: 450, height: 25, alignment: .leading)
                                    .font(.title3)
                                    .padding(.top, 10)
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
            
//            Button(action: {}, label: {
//                Text("Save Expense")
//                    .foregroundColor(Color("AccentColor2"))
//                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
//                    .frame(width: 358, height: 50)
//                    .background(Color("AccentColor"))
//                    .clipped()
//                    .cornerRadius(16)
//                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
//                    .padding(.bottom)
//            })
//            .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 500, height: .infinity)
        .background(Color("MainColor"))
    }
}



struct ChooseProductModal_Previews: PreviewProvider {
    static var previews: some View {
        ChooseProductModal(chooseProductt: .constant(true))
    }
}
