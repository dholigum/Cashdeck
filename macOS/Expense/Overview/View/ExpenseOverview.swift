//
//  ExpenseOverview.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ExpenseOverview: View {
    
    @StateObject var expenseVM = ExpenseViewModel()
    @StateObject var overviewExpenseVM = OverviewExpenseViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.bottom)
                .foregroundColor(Color("AccentColor2"))
            
            HStack(spacing: 20) {
                MonthlyExpenseChart(overviewExpenseVM: overviewExpenseVM)
                
                VStack(spacing: 20) {
                    RecentExpenseOverviewCard(expenseVM: expenseVM)
                    ExpenseTipsCard()
                }
            }
        }
        .padding(.top, -28)
        .padding(.horizontal, -2)
    }
}

struct ExpenseOverview_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseOverview()
    }
}
