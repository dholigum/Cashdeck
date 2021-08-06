//
//  MonthSelector.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct MonthSelector: View {
    
    var month: String
    var monthName: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Des"]
    
    @Binding var selectedMonthIndex: Int
    
    var body: some View {
        Text(month)
            .font(Font.custom("SFProDisplay-Semibold", size: 14))
            .frame(width:60, height: 60)
            .background(month == monthName[selectedMonthIndex] ? Color("TapedMenuColor") : Color.white)
            .cornerRadius(8)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}
