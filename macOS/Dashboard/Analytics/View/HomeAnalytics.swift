//
//  HomeAnalytics.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 09/08/21.
//

import SwiftUI

struct HomeAnalytics: View {
    
    @State private var chartOptions = "Income"
    var options = ["Income","Expense","Net Income"]
    @State private var durationOptions = "Income"
    var duration = ["Daily","Weekly","Monthly","Yearly"]
    
    @StateObject var expenseVM = ExpenseViewModel()
    @StateObject var overviewExpenseVM =  OverviewExpenseViewModel()
    
    let businessUpdateVM = BusinessUpdateViewModel.shared

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 18){
                Text("Overview")
                    .font(Font.custom("SFProDisplay-Bold", size: 24))
                    .foregroundColor(Color("AccentColor2"))
                
                VStack (alignment: .leading, spacing: 18){
                    
                    HStack{
                        Text("Chart")
                            .font(Font.title.weight(.semibold))
                            .padding(.vertical)
                            .foregroundColor(Color("AccentColor2"))
                            .padding(.top, 4)
                            .padding(.leading, 20)
                        
                        Picker(selection:$chartOptions, label: Text("")){
                            ForEach(options, id:\.self){
                                Text($0)
                            }
                        }
                        .onReceive([self.chartOptions].publisher.first(), perform: { (value) in
                            changeDataSet(value: value)
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 426)
                        .padding(.leading,250)
                        
//                        ActionButtonCard(icon: "calendar", title: overviewExpenseVM.formatedMonthYear(), defaultColor: Color("MainColor"), isPressed: $overviewExpenseVM.isOpenCalendar )
//                            .onTapGesture {
//                                overviewExpenseVM.isOpenCalendar.toggle()
//                            }
//                            .sheet(isPresented: $overviewExpenseVM.isOpenCalendar) {
//                                MonthYearCalendar(overviewExpenseVM: overviewExpenseVM)
//                            }
//                            .padding(.leading,90)

                    }
                    
                    if chartOptions == "Income" {
                        HomeAnalyticsCard(title: "Chart", legend: "IDR", barColor: Color("AccenColor2"), data: businessUpdateVM.getIncomePerDayData())
                    } else if chartOptions == "Expense" {
                        HomeAnalyticsCard(title: "Expense", legend: "IDR", barColor: Color("AccenColor2"), data: expenseVM.groupedExpenseByMonth)
                    } else {
                        HomeAnalyticsCard(title: "Expense", legend: "IDR", barColor: Color("AccenColor2"), data: businessUpdateVM.getNetIncomeValuesPerDay())
                    }
                    
                }
                .frame(width: 1000, height: 700)
                .background(Color.white)
                .cornerRadius(16)
                .clipped()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
            }
            .frame(width: geometry.frame(in: .global).size.width, height: geometry.frame(in: .global).size.height, alignment: .leading)
            .padding(.leading, 12)
            .onAppear() { expenseVM.getAllMonthExpense() }
        }
    }
    
    func changeDataSet(value: String){
        print(value)
    }
}

struct HomeAnalytics_Previews: PreviewProvider {
    static var previews: some View {
        HomeAnalytics()
    }
}
