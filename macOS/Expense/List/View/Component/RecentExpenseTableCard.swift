//
//  RecentExpenseTableCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct RecentExpenseTableCard: View {
    
    @StateObject var expenseVM = ExpenseViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Recent Expense")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .padding(EdgeInsets(top: 22, leading: 22, bottom: 24, trailing: 0))
                
                Spacer()
                
                ActionButtonCard(icon: "calendar", title: expenseVM.formatedMonthYear(), defaultColor: Color("MainColor"), isPressed: $expenseVM.isOpenCalendar )
                    .onTapGesture {
                        expenseVM.isOpenCalendar.toggle()
                    }
                    .sheet(isPresented: $expenseVM.isOpenCalendar) {
                        FilterCalendar(expenseVM: expenseVM)
                    }
            }
            .padding(.trailing, 16)
            
            ExpenseTableHeader()
            
            ScrollView(.vertical, showsIndicators: true, content: {
                LazyVStack {
                    if expenseVM.expenses.count > 0 {
                        ForEach(expenseVM.expenses, id: \.self) { expense in
                            VStack(alignment: .leading) {
                                HStack {
                                    
                                    if let date = expense.date, let category = expense.category, let name = expense.name, let price = expense.price {
                                        
                                        Text(date.dateFormatting())
                                            .font(.system(size: 14))
                                            .frame(width: 160, alignment: .leading)
                                        Text(category)
                                            .font(.system(size: 14))
                                            .frame(minWidth: 105, alignment: .leading)
                                        Text(name)
                                            .font(.system(size: 14))
                                            .frame(minWidth: 450, alignment: .leading)
                                        Text("\(price)".currencyFormatting())
                                            .font(.system(size: 14))
                                            .frame(minWidth: 118, alignment: .leading)
                                        
                                        HStack(spacing: 10) {
                                            
                                            Button(action: {
                                                expenseVM.editExpense(expense)
                                            }, label: {
                                                Image(systemName: "square.and.pencil")
                                                    .font(.system(size: 18))
                                                    .foregroundColor(Color("AccentColor2"))
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                            .sheet(isPresented: $expenseVM.isNewData) {
                                                ExpenseSheet(expenseVM: expenseVM)
                                            }
                                            
                                            Button(action: {
                                                expenseVM.deleteExpense(expense)
                                            }, label: {
                                                Image(systemName: "trash.fill")
                                                    .font(.system(size: 18))
                                                    .foregroundColor(Color("OrangeColor"))
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                        .frame(minWidth: 120, alignment: .leading)
                                    }
                                }
                                
                                CustomDivider(width: 920)
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            
                            Image("noExpensesIllustration")
                                .resizable()
                                .frame(width: 356, height: 272)
                                .aspectRatio(contentMode: .fill)
                            
                            Text("You have no expenses yet.")
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AccentColor2"))
                        }
                        .padding(.top, 36)
                    }
                }
            })
            .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0))
            
        }
        .frame(width: 1012, height: 597)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .onAppear() { expenseVM.getAllExpense() }
    }
}


