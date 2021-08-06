//
//  ExpenseSheet.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 06/08/21.
//

import SwiftUI

struct ExpenseSheet: View {
    
    @StateObject var expenseVM = ExpenseViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    expenseVM.isNewData = false
                    NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
                }, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text(expenseVM.updateItem != nil ? "Edit Expense" : "Add Expense")
                    .foregroundColor(Color("OrangeColor"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                
                Spacer()
                
                if expenseVM.updateItem != nil {
                    Button(action: {
                        expenseVM.writeExpense()
                        expenseVM.isNewData = false
                        NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
                    }, label: {
                        Text("   Save")
                            .font(Font.title3.weight(.medium))
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)
                } else {
                    Text("\t\t")
                        .padding(.horizontal)
                }
                
            } // Sheet Header
            .frame(width: 392, height: 50)
            .background(Color("AccentColor"))
            
            VStack(spacing: 8) {
                TextField("Rp ..........", text: $expenseVM.amount)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Amount"))
                    .padding(.top)
                
                TextField("Expense Name", text: $expenseVM.name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Name"))
                
                TextField("Expense Quantity", text: $expenseVM.quantity)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Quantity"))
                
                Picker("", selection: $expenseVM.categoryIndex) {
                    ForEach(0 ..< K().categories.count) {
                        Text(K().categories[$0])
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    }
                }
                .pickerStyle(PopUpButtonPickerStyle())
                .modifier(WithTopLabelTextField(labelName: "Category"))
                
                DatePicker("", selection: $expenseVM.date, displayedComponents: .date)
                    .pickerStyle(InlinePickerStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Date"))
                
                Picker("", selection: $expenseVM.repeatIndex) {
                    ForEach(0 ..< K().repeats.count) {
                        Text(K().repeats[$0])
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    }
                }
                .pickerStyle(PopUpButtonPickerStyle())
                .modifier(WithTopLabelTextField(labelName: "Repeat"))
            }
            
            Spacer()
            
            if expenseVM.updateItem == nil {
                Button(action: {
                    expenseVM.writeExpense()
                    expenseVM.isNewData = false
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
            
        }
        .frame(width: 392)
        .background(Color("MainColor"))
    }
}

struct ExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSheet()
    }
}

