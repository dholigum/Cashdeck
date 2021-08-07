//
//  SimpleExpense.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 06/08/21.
//

import Foundation

class SimpleExpense {
    let name: String?
    let cost: Double
    
    init(name: String, cost: Double) {
        
        self.name = name
        self.cost = cost
    }
    
    static func + (lhs: SimpleExpense, rhs: SimpleExpense) -> SimpleExpense? {
        if rhs.name != lhs.name {
            return nil
        } else {
            return SimpleExpense(name: lhs.name!, cost: lhs.cost + rhs.cost)
        }
    }
}
