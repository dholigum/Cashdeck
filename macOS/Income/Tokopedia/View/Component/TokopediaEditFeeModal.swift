//
//  EditFeeModal.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

struct TokopediaEditFeeModal: View {
    @Binding var isPresented: Bool
    @ObservedObject var feeVM = TokopediaFeeViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    isPresented = false
                    NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
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
            .frame(width: 400, height: 50)
            .background(Color("AccentColor"))
            
            VStack(spacing: 9) {
                TextField("Product Fee", text: $feeVM.productFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Product Fee", frameHeight: 82))
                    .padding(.top, 20)
                TextField("Shipping Fee", text: $feeVM.shippingFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Shipping Fee", frameHeight: 82))
                TextField("Max Shipping Fee", text: $feeVM.maxShippingFee)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Maximum Shipping Fee", frameHeight: 82))
            
            }
            
            Spacer()
            
            Button(action: {
                feeVM.editFee()
                NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
            }, label: {
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
        .frame(width: 400, height: 461)
        .background(Color("MainColor"))
    }
}
