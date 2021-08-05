//
//  ExpenseModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import Foundation

class ExpenseModel: Identifiable {
    
    var date: Date
    var category: String
    var name: String
    var quantity: Int
    var cost: Int
    var repeatEvery: String
    
    init(date: Date, category: String, name: String, quantity: Int, cost: Int, repeatEvery: String) {
        self.date = date
        self.category = category
        self.name = name
        self.quantity = quantity
        self.cost = cost
        self.repeatEvery = repeatEvery
    }
}
