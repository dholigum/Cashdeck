//
//  MonthYearCalendar.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct MonthYearCalendar: View {
    
    @State var selectedYearIndex = 21
    @State var selectedMonthIndex = 0
    @StateObject var overviewExpenseVM = OverviewExpenseViewModel()
    
    let years = [Int](2000...2040)
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                
                Button(action: {
                    if overviewExpenseVM.yearIndex > 0 { withAnimation { overviewExpenseVM.yearIndex -= 1 } }
                    else { withAnimation { overviewExpenseVM.yearIndex = 0 }}
                }, label: {
                    Image(systemName: "chevron.backward")
                })
                
                Text(String(years[overviewExpenseVM.yearIndex]))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .frame(width: 70)
                
                Button(action: {
                    if overviewExpenseVM.yearIndex < 40 { withAnimation { overviewExpenseVM.yearIndex += 1 } }
                    else { withAnimation { overviewExpenseVM.yearIndex = 40 }}
                }, label: {
                    Image(systemName: "chevron.forward")
                })
                
            }
            .frame(width: 270, height: 50)
            .background(Color("AccentColor"))
            .padding(.bottom)
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    Button(action: { overviewExpenseVM.monthIndex = 0 }, label: {
                        MonthSelector(month: "Jan", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 1 }, label: {
                        MonthSelector(month: "Feb", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 2 }, label: {
                        MonthSelector(month: "Mar", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { overviewExpenseVM.monthIndex = 3 }, label: {
                        MonthSelector(month: "Apr", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 4 }, label: {
                        MonthSelector(month: "May", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 5 }, label: {
                        MonthSelector(month: "Jun", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { overviewExpenseVM.monthIndex = 6 }, label: {
                        MonthSelector(month: "Jul", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 7 }, label: {
                        MonthSelector(month: "Aug", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 8 }, label: {
                        MonthSelector(month: "Sep", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { overviewExpenseVM.monthIndex = 9 }, label: {
                        MonthSelector(month: "Oct", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { overviewExpenseVM.monthIndex = 10 }, label: {
                        MonthSelector(month: "Nov", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 11 }, label: {
                        MonthSelector(month: "Des", selectedMonthIndex: $overviewExpenseVM.monthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
            }
            
            Spacer()
            
            Button(action: {
                overviewExpenseVM.isOpenCalendar = false
                overviewExpenseVM.getMonthlyGroupedExpense()
                overviewExpenseVM.showPieChart.toggle()
                overviewExpenseVM.showPiecHartLegend.toggle()
                NSApp.mainWindow?.endSheet(NSApp.keyWindow!)
                
            }, label: {
                Text("Select Month")
                    .foregroundColor(Color("AccentColor2"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(width: 220, height: 40)
                    .background(Color("AccentColor"))
                    .clipped()
                    .cornerRadius(8)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
                    .padding(.bottom)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.top)
        }
        .frame(width: 270, height: 440)
        .background(Color("MainColor"))
    }
}

struct MonthYearCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MonthYearCalendar()
    }
}
