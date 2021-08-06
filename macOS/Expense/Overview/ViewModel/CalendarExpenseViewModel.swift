//
//  OverviewExpenseViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

class ExpenseCalendarViewModel: ObservableObject {
    
    @Published var isOpenCalendar = false
    @Published var yearIndex = 21
    @Published var monthIndex = 0
    
    func formatedMonthYear() -> String {
        let realYear = 2000 + yearIndex
        let realMonth = K().monthName[monthIndex]
        
        return "\(realMonth) \(realYear)"
    }
}
