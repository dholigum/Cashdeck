//
//  RecentExpenseCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct RecentExpenseOverviewCard: View {
    
    @StateObject var expenseVM: ExpenseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Recent Expense")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(Color("AccentColor2"))
                .padding(EdgeInsets(top: 22, leading: 16, bottom: 24, trailing: 0))
            
            ExpenseTableHeader(dateWidth: 80, categoryWidth: 80, nameWidth: 250, priceWidth: 120, actionWidrh: 0, leadingPadding: 16)
            
            ScrollView(.vertical, showsIndicators: true, content: {
                LazyVStack(alignment: .leading) {
                    if expenseVM.expenses.count > 0 {
                        ForEach(expenseVM.expenses, id: \.self) { expense in
                            VStack(alignment: .leading) {
                                HStack {
                                    
                                    if let date = expense.date, let category = expense.category, let name = expense.name, let price = expense.price {
                                        
                                        Text(date.shortDateFormatting())
                                            .font(.system(size: 14))
                                            .frame(width: 80, alignment: .leading)
                                        Text(category)
                                            .font(.system(size: 14))
                                            .frame(width: 80, alignment: .leading)
                                        Text(name)
                                            .font(.system(size: 14))
                                            .frame(width: 250, alignment: .leading)
                                        Text("\(price)".currencyFormatting())
                                            .font(.system(size: 14))
                                            .frame(width: 120, alignment: .leading)
                                    }
                                }
                                
                                CustomDivider(width: 560)
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            
                            Image("noExpensesIllustration")
                                .resizable()
                                .frame(width: 178, height: 136)
                                .aspectRatio(contentMode: .fill)
                            
                            Text("You have no expenses yet.")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AccentColor2"))
                        }
                        .padding(.top, 36)
                    }
                }
            })
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
            
        }
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .padding(.trailing, 8)
        .padding(.bottom, 8)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .onAppear() { expenseVM.getAllExpense() }
    }
}
