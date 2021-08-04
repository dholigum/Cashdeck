//
//  TransactionModel.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 03/08/21.
//

import Foundation

class transactionModel: Identifiable {
    
    var date: Date
    var productName: String
    var qyt: Int
    var price: Int
    
    init(date: Date, productName: String, qyt: Int, price: Int) {
        self.date = date
        self.productName = productName
        self.qyt = qyt
        self.price = price
    }
}
