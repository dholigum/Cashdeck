//
//  HomeOverview.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct HomeOverview: View {
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

struct HomeOverview_Previews: PreviewProvider {
    static var previews: some View {
        HomeOverview()
    }
}
