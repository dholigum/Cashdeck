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
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                Text("Expense Overview")
                    .font(Font.custom("SFProDisplay-Bold", size: 24))
                    .padding(.bottom)
                    .foregroundColor(Color("AccentColor2"))
                
                HStack(spacing: 20) {
                    MonthlyExpenseChart(overviewExpenseVM: overviewExpenseVM)
                    
                    VStack(spacing: 20) {
                        RecentExpenseOverviewCard(expenseVM: expenseVM)
                        ExpenseTipsCard(overviewExpenseVM: overviewExpenseVM)
                    }
                }
            }
            .frame(width: geometry.frame(in: .global).size.width, height: geometry.frame(in: .global).size.height, alignment: .leading)
                        .padding(.leading, 12)
        }
    }
}

struct ExpenseOverview_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseOverview()
            .environment(\.sizeCategory, .large)
    }
}
