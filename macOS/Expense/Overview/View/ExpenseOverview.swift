//
//  ExpenseOverview.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ExpenseOverview: View {
    var body: some View {
        VStack(spacing: 36) {
            HStack(spacing: 24) {
                MonthlyExpenseCard()
                RecentExpenseCard()
            }
            HStack(spacing: 24) {
                ExpenseTipsCard()
            }
        }
    }
}

struct ExpenseOverview_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseOverview()
    }
}
