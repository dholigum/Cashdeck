//
//  ExpenseList.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ExpenseList: View {
    var body: some View {
        VStack(spacing: 36) {
            HStack {
                NetIncomeCard()
            }
            HStack(spacing: 24) {
                MonthlyExpenseCard()
                ProductSoldCard()
            } // Expense and Product
        }
    }
}

struct ExpenseList_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseList()
    }
}
