//
//  RecentExpenseCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct RecentExpenseOverviewCard: View {
    
    @StateObject var expenseVM = ExpenseViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Recent Expense")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(Color("AccentColor2"))
                .padding(EdgeInsets(top: 22, leading: 16, bottom: 24, trailing: 0))
            
            ExpenseTableHeader(dateWidth: 80, categoryWidth: 80, nameWidth: 250, priceWidth: 120, actionWidrh: 0, leadingPadding: 16)
            CustomDivider(width: 560)
                .padding(EdgeInsets(top: -8, leading: 16, bottom: 0, trailing: 0))
            
            if expenseVM.expenses.count > 0 {
                ScrollView(.vertical, showsIndicators: true, content: {
                    LazyVStack {
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
                    }
                })
                .padding(EdgeInsets(top: 0, leading: -8, bottom: 0, trailing: 0))
            } else {
                HStack {
                    Image("noTransactionIllustration")
                        .resizable()
                        .frame(width: 356, height: 272)
                        .aspectRatio(contentMode: .fill)
                } .padding(.top, 30)
                
                Text("You have no expenses yet.")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentColor2"))
            }
            
            
        }
        .frame(width: 600, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .onAppear() { expenseVM.getAllExpense() }
    }
}
