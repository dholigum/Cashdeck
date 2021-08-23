//
//  ModalEditProduct.swift
//  Cashdeck
//
//  Created by Revarino Putra on 22/08/21.
//

import SwiftUI

struct ModalEditProduct: View {
    @StateObject var productVM = ProductViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {productVM.isPresented = false}, label: {
                    Text("Cancel")
                        .font(.system(size: 17))
                        .padding(.init(top: 18, leading: 18, bottom: 18, trailing: 18))
                        .frame(width: 100, alignment: .leading)
                })
                .buttonStyle(PlainButtonStyle())
                Text("Edit Product")
                    .font(.system(size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .frame(width: 192, alignment: .center)
                Text(" ")
                    .frame(width: 100)
            }
            .background(Color("AccentColor"))
            
            VStack (spacing: 8) {
                
                TextField("", text: $productVM.sku)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Regular", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "SKU", frameHeight: 74))
                    .padding(.top)
                
                TextField("", text: $productVM.name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Regular", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "Name", frameHeight: 74))
                TextField("", text: $productVM.color)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Regular", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "Variant", frameHeight: 74))
                TextField("", text: $productVM.size)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Regular", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "Size", frameHeight: 74))
                
                TextField("", text: $productVM.qty)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "Quantity", frameHeight: 74))
                TextField("", text: $productVM.cost)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Regular", size: 24).weight(.light))
                    .modifier(WithTopLabelTextField(labelName: "Cost Price", frameHeight: 74))
                
                Button(action: {
                    productVM.editProduct()
                    productVM.isPresented = false
                    NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(Color("AccentColor2"))
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .frame(width: 358, height: 50)
                        .background(Color("AccentColor"))
                        .clipped()
                        .cornerRadius(16)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
                        .padding(EdgeInsets(top: 32, leading: 0, bottom: 29, trailing: 0))
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(width: 392)
        .background(Color("MainColor"))
    }
}

struct ModalEditProduct_Previews: PreviewProvider {
    static var previews: some View {
        ModalEditProduct()
    }
}
