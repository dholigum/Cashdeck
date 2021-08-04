//
//  ExpenseOverview.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ExpenseOverview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.bottom)
                .foregroundColor(Color("AccentColor2"))
            
            HStack(spacing: 24) {
                MonthlyExpenseCard()
                RecentExpenseCard()
            }
            HStack(spacing: 24) {
                ExpenseTipsCard()
            }
        }
        .padding(.top, -40)
        .padding(.horizontal, -2)
    }
}

struct ExpenseOverview_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseOverview()
    }
}
