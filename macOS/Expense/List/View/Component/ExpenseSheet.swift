//
//  AddExpenseSheet.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ExpenseSheet: View {
    
    @ObservedObject var amountViewModel = AmountViewModel()
    
    var expenseListVM: ExpenseListViewModel
    
    @Binding var isVisible: Bool
    @State private var amount: String = ""
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var categoryIndex = 0
    @State private var date = Date()
    @State private var repeatIndex = 0
    
    @State var expense: ExpenseModel?
    
    var categories = ["Utilities", "Transport", "Housing", "Personal", "Finance"]
    var repeats = ["Every Week", "Every Month", "Every 2 Month", "Every 4 Month", "Every 6 Month"]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    self.isVisible = false
                    NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
                }, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Add Expense")
                    .foregroundColor(Color("OrangeColor"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                
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
                    .font(Font.custom("SFProDisplay-Semibold", size: 28))
                    .foregroundColor(Color("OrangeColor"))
                    .modifier(WithTopLabelTextField(labelName: "Amount"))
                    .padding(.top)
                
                TextField("Expense Name", text: $name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Name"))
                
                TextField("Expense Quantity", text: $quantity)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Quantity"))
                
                Picker("", selection: $categoryIndex) {
                    ForEach(0 ..< categories.count) {
                        Text(self.categories[$0])
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    }
                }
                .pickerStyle(PopUpButtonPickerStyle())
                .modifier(WithTopLabelTextField(labelName: "Category"))
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .pickerStyle(InlinePickerStyle())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .modifier(WithTopLabelTextField(labelName: "Date"))
                
                Picker("", selection: $repeatIndex) {
                    ForEach(0 ..< repeats.count) {
                        Text(self.repeats[$0])
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    }
                }
                .pickerStyle(PopUpButtonPickerStyle())
                .modifier(WithTopLabelTextField(labelName: "Repeat"))
            }
            
            Spacer()
            
            Button(action: {
                expenseListVM.addExpenseCategory(categories[categoryIndex])
                
                expense = ExpenseModel(date: date, category: categories[categoryIndex], name: name, quantity: Int(quantity) ?? 0, cost: Int(amountViewModel.amount) ?? 0, repeatEvery: repeats[repeatIndex])
                
                expenseListVM.addExpense(expense!)
                
                self.isVisible = false
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
        .frame(width: 392)
        .background(Color("MainColor"))
    }
}