//
//  HomeOverview.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct HomeOverview: View {
    
    var window = NSScreen.main?.visibleFrame
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.top, 20)
                .foregroundColor(Color("AccentColor2"))
            
            HStack {
                NetIncomeCard(title: "Daily Net Income", legend: "IDR", barColor: Color("AccentColor2"), data: chartDataSet)
                VStack (alignment: .leading, spacing: 18){
                    BusinessGrowthCard()
                    BusinessUpdateCard()
                }.padding()
            }
            
            HStack(spacing: 18) {
                MonthlyExpenseCard()
                ProductSoldCard()
            } // Expense and Product
        }
        .frame(minWidth: window!.width / 1.8, alignment: .leading)
        .padding(.leading, 12)
        
        
    }
}

struct HomeOverview_Previews: PreviewProvider {
    static var previews: some View {
        HomeOverview()
    }
}
