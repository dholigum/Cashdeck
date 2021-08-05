//
//  HomeOverview.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct HomeOverview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .foregroundColor(Color("AccentColor2"))
            
            HStack {
                NetIncomeCard(title: "Daily Net Income", legend: "IDR", barColor: .blue, data: chartDataSet)
            }
            
            HStack(spacing: 24) {
                MonthlyExpenseCard()
                ProductSoldCard()
            } // Expense and Product
        }
        .padding(.horizontal, 8)
        .padding(.top, -28)
    }
}

struct HomeOverview_Previews: PreviewProvider {
    static var previews: some View {
        HomeOverview()
    }
}
