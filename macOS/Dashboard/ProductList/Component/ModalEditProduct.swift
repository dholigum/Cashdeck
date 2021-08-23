//
//  ModalEditProduct.swift
//  Cashdeck
//
//  Created by Revarino Putra on 22/08/21.
//

import SwiftUI

struct ModalEditProduct: View {
    @Binding var isVisible: Bool
    @StateObject var productVM = ProductViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {isVisible = false}, label: {
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
            
            HStack {
                TextField("Rp ..........", text: $productVM.sku)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Amount", frameHeight: 74))
                    .padding(.top)
            }
        }
    }
}

struct ModalEditProduct_Previews: PreviewProvider {
    static var previews: some View {
        ModalEditProduct(isVisible: .constant(true))
    }
}
