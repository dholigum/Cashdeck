//
//  ProductSoldViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import Foundation

class ProductSoldViewModel {
    var soldData = [TransactionDetail]()
    
    init() {
        fetchAll()
    }
    
    func fetchAll() {
        self.soldData = ProductSoldModel.shared.getAllDetail()
    }
    
    func getNetIncome(sku: String) -> Int64 {
        var totalSellingPrice: Int64 = 0
        let product = ProductSoldModel.shared.getProduct(sku: sku)
        let detail = ProductSoldModel.shared.getAllDetail().filter { $0.td_product == product }
        
        for data in detail {
            totalSellingPrice += data.price
        }
        let costPrice = Int64(detail.count) * product.costPrice
        return totalSellingPrice - costPrice
    }
}
