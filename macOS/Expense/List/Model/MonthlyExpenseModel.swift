//
//  MonthlyExpenseModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 16/08/21.
//

import Foundation

class MonthlyExpenseModel {
    let date: Date?
    let cost: Double
    let month: String?
    
    init(date: Date, cost: Double, month: String) {
        
        self.date = date
        self.cost = cost
        self.month = month
    }
    
    static func + (lhs: MonthlyExpenseModel, rhs: MonthlyExpenseModel) -> MonthlyExpenseModel? {
        if rhs.month != lhs.month {
            return nil
        } else {
            return MonthlyExpenseModel(date: lhs.date!, cost: lhs.cost + rhs.cost, month: lhs.month!)
        }
    }
}
