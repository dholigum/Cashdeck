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
    var qyt: Int64
    var price: Int64
    var SKU: String
    var orderId: String
    
    init(date: Date, productName: String, qyt: Int64, price: Int64, SKU: String, orderId:String) {
        self.date = date
        self.productName = productName
        self.qyt = qyt
        self.price = price
        self.SKU = SKU
        self.orderId = orderId
    }
}
