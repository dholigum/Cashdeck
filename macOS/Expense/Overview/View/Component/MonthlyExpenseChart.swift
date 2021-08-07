//
//  MonthlyExpenseChart.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct MonthlyExpenseChart: View {
    
    @StateObject var overviewExpenseVM = OverviewExpenseViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 32) {
                Text("Monthly Expense")
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                
                ActionButtonCard(icon: "calendar", title: overviewExpenseVM.formatedMonthYear(), isPressed: $overviewExpenseVM.isOpenCalendar)
                    .onTapGesture {
                        overviewExpenseVM.isOpenCalendar.toggle()
                        overviewExpenseVM.showPieChart.toggle()
                        overviewExpenseVM.showPiecHartLegend.toggle()
                    }
                    .sheet(isPresented: $overviewExpenseVM.isOpenCalendar) {
                        MonthYearCalendar(overviewExpenseVM: overviewExpenseVM)
                    }
            }
            
            HStack {

                if overviewExpenseVM.showPieChart {
                    PieChartView(values: overviewExpenseVM.groupedDataValues, names: overviewExpenseVM.groupedDataLabels)
                        .frame(width: 300, height: 300)
                }
            }
            .padding(.top, -8)
            .padding(.leading, -16)
            
            if overviewExpenseVM.showPieChart {
                PieChartLegend(values: overviewExpenseVM.groupedDataValues, names: overviewExpenseVM.groupedDataLabels)
            }
            
            Spacer()
            
        }
        .frame(width: 375, height: 784)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
        .onAppear() {
            overviewExpenseVM.getMonthlyGroupedExpense()
            overviewExpenseVM.showPieChart.toggle()
        }
    }
}

struct MonthlyExpenseChart_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyExpenseChart()
    }
}
