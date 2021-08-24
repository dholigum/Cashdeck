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
    
    var window = NSScreen.main?.visibleFrame
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.bottom)
                .padding(.top, 20)
                .foregroundColor(Color("AccentColor2"))
            
            HStack(spacing: 20) {
                MonthlyExpenseChart(overviewExpenseVM: overviewExpenseVM)
                
                VStack(spacing: 20) {
                    RecentExpenseOverviewCard(expenseVM: expenseVM)
                    ExpenseTipsCard(overviewExpenseVM: overviewExpenseVM)
                }
            }
        }
        .frame(minWidth: window!.width / 1.8, alignment: .leading)
        .padding(.leading, 12)
        
    }
}

struct ExpenseOverview_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseOverview()
            .environment(\.sizeCategory, .large)
    }
}
