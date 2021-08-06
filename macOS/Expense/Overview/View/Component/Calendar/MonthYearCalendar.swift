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
    
    let years = [Int](2000...2040)
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if selectedYearIndex > 0 { withAnimation { selectedYearIndex -= 1 } }
                    else { withAnimation { selectedYearIndex = 0 }}
                }, label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .padding(.horizontal, 4)
                })
                
                
                Text(String(years[selectedYearIndex]))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .padding(.horizontal, 48)
                
                Button(action: {
                    if selectedYearIndex < 40 { withAnimation { selectedYearIndex += 1 } }
                    else { withAnimation { selectedYearIndex = 40 }}
                }, label: {
                    Image(systemName: "chevron.forward")
                        .resizable()
                        .padding(.horizontal, 4)
                })
            }
            .frame(width: 300, height: 50)
            .background(Color("AccentColor"))
            .padding(.bottom)
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    Button(action: { selectedMonthIndex = 0 }, label: {
                        MonthSelector(month: "Jan", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 1 }, label: {
                        MonthSelector(month: "Feb", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 2 }, label: {
                        MonthSelector(month: "Mar", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { selectedMonthIndex = 3 }, label: {
                        MonthSelector(month: "Apr", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 4 }, label: {
                        MonthSelector(month: "May", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 5 }, label: {
                        MonthSelector(month: "Jun", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { selectedMonthIndex = 6 }, label: {
                        MonthSelector(month: "Jul", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 7 }, label: {
                        MonthSelector(month: "Aug", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 8 }, label: {
                        MonthSelector(month: "Sep", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
                
                HStack(spacing: 16) {
                    Button(action: { selectedMonthIndex = 9 }, label: {
                        MonthSelector(month: "Oct", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 10 }, label: {
                        MonthSelector(month: "Nov", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { selectedMonthIndex = 11 }, label: {
                        MonthSelector(month: "Des", selectedMonthIndex: $selectedMonthIndex)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }.frame(height: 60)
            }
            
            Spacer()
        }
        .frame(width: 270, height: 390)
        .background(Color("MainColor"))
    }
}

struct MonthYearCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MonthYearCalendar()
    }
}
