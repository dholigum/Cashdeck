//
//  MonthlyExpenseChart.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct MonthlyExpenseChart: View {
    
    @StateObject var overviewExpenseVM:  OverviewExpenseViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Monthly Expense")
                    .font(Font.custom("SFProDisplay-Bold", size: 18))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))

                
                Spacer()
                
                ActionButtonCard(icon: "calendar", title: overviewExpenseVM.formatedMonthYear(), defaultColor: Color("MainColor"), isPressed: $overviewExpenseVM.isOpenCalendar )
                    .onTapGesture {
                        overviewExpenseVM.isOpenCalendar.toggle()
                        overviewExpenseVM.showPieChart.toggle()
                        overviewExpenseVM.showPieChartLegend.toggle()
                    }
                    .sheet(isPresented: $overviewExpenseVM.isOpenCalendar) {
                        MonthYearCalendar(overviewExpenseVM: overviewExpenseVM)
                    }
            }
            .padding(EdgeInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 16)))
            
            HStack {

                if overviewExpenseVM.showPieChart {
                    PieChartView(values: overviewExpenseVM.groupedDataValues, names: K().categories)
                        .frame(width: 300, height: 300)
                }
            }
            .padding(.top, -8)
            .padding(.leading, -16)
            
            if overviewExpenseVM.showPieChartLegend {
                PieChartComplexLegend(values: overviewExpenseVM.groupedDataValues, oldValues: overviewExpenseVM.groupedPrevDataValues, names: K().categories)
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
            overviewExpenseVM.showPieChartLegend.toggle()
        }
    }
}
