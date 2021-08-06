//
//  EditFeeModal.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

struct EditFeeModal: View {
    
    @State private var productFee: String = ""
    @State private var shippingFee: String = ""
    @State private var maxShippingFee: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                }, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Edit Fee")
                    .foregroundColor(Color("AccentColor2"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                
                Spacer()
                
                Text("\t\t")
                    .padding(.horizontal)
            } // Sheet Header
            .frame(width: .infinity, height: 50)
            .background(Color("AccentColor"))
            
            VStack(spacing: 8) {
                TextField("Product Fee", text: $productFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Product Fee", isWithCurrency: false))
                TextField("Shipping Fee", text: $shippingFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Shipping Fee", isWithCurrency: false))
                TextField("Max Shipping Fee", text: $maxShippingFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Maximum Shipping Fee", isWithCurrency: true))
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Save Expense")
                    .foregroundColor(Color("AccentColor2"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 358, height: 50)
                    .background(Color("AccentColor"))
                    .clipped()
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
                    .padding(.bottom)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 400, height: .infinity)
        .background(Color("MainColor"))
    }
}

struct EditFeeModal_Previews: PreviewProvider {
    static var previews: some View {
        EditFeeModal()
    }
}
