//
//  MonthlyExpenseCard.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct MonthlyExpenseCard: View {
    
    @StateObject var overviewExpenseVM = OverviewExpenseViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Monthly Expense")
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            HStack {

                if overviewExpenseVM.showPieChart {
                    PieChartView(values: overviewExpenseVM.groupedDataValues, names: K().categories)
                        .frame(width: 300, height: 300)
                }
                
                if overviewExpenseVM.showPieChartLegend {
                    PieChartLegend(values: overviewExpenseVM.groupedDataValues, names: K().categories)
                }
            }
            .padding(.top, -16)
            .padding(.leading, -24)
            
            Spacer()
        }
        .frame(width: 490, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
        .onAppear() {
            overviewExpenseVM.getMonthlyGroupedExpense()
            overviewExpenseVM.showPieChart.toggle()
            overviewExpenseVM.showPieChartLegend.toggle()
        }
    }
}

struct MonthlyExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyExpenseCard()
    }
}
