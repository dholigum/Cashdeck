//
//  MonthlyExpenseChart.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct MonthlyExpenseChart: View {
    
    let dataValues: [Double] = [30, 24, 21, 13, 12]
    let dataLabels: [String] = ["Utilities", "Transport", "Housing", "Personal", "Finance"]
    
    @StateObject var calendarVM = ExpenseCalendarViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 32) {
                Text("Monthly Expense")
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                
                ActionButtonCard(icon: "calendar", title: calendarVM.formatedMonthYear(), isPressed: $calendarVM.isOpenCalendar)
                    .onTapGesture { calendarVM.isOpenCalendar.toggle() }
                    .sheet(isPresented: $calendarVM.isOpenCalendar) {
                        MonthYearCalendar(calendarVM: calendarVM)
                    }
            }
            
            HStack {

                PieChartView(values: dataValues, names: dataLabels, formatter: {value in String(format: "Rp %.0f", value)})
                    .frame(width: 300, height: 300)
            }
            .padding(.top, -8)
            .padding(.leading, -16)
            
            PieChartLegend(values: dataValues, names: dataLabels)
            
            Spacer()
            
        }
        .frame(width: 375, height: 784)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
    }
}

struct MonthlyExpenseChart_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyExpenseChart()
    }
}