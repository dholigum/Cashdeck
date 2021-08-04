//
//  AddExpenseSheet.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct AddExpenseSheet: View {
    
    @ObservedObject var amountViewModel = AmountViewModel()
    
    @Binding var isVisible: Bool
    @State private var amount: String = ""
    @State private var name: String = ""
    @State private var quantity: String = ""
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        
        return formatter
    }()
    
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    self.isVisible = false
                }, label: {
                    Text("Cancel")
                        .font(Font.title3.weight(.medium))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Add Expense")
                    .foregroundColor(Color("OrangeColor"))
                    .font(Font.title2.weight(.medium))
                
                Spacer()
                
                Text("\t\t")
                    .padding(.horizontal)
                
                //                Button(action: {
                //                    self.isVisible = false
                //                }, label: {
                //                    Text("   Save")
                //                        .font(Font.title3.weight(.medium))
                //                })
                //                .buttonStyle(PlainButtonStyle())
                //                .padding(.horizontal)
                
            } // Sheet Header
            .frame(width: 392, height: 50)
            .background(Color("AccentColor"))
            
            VStack(spacing: 8) {
                TextField("...", text: $amountViewModel.amount)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.title.weight(.semibold))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Amount", isWithCurrency: true))
                    
                TextField("...", text: $name)
                .textFieldStyle(PlainTextFieldStyle())
                .font(Font.title2.weight(.medium))
                .modifier(WithTopLabelTextField(labelName: "Name", isWithCurrency: false))
            }
            
            Spacer()
        }
        .frame(width: 392, height: 685)
        .background(Color("MainColor"))
    }
}
