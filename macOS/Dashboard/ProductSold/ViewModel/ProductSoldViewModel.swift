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
    
    func getTotalNetIncome() -> Int64 {
        var totalDetail: Int64 = 0
        var totalCost: Int64 = 0
        
        for data in ProductSoldModel.shared.getAllDetail() {
            totalDetail += data.price
            totalCost += data.td_product!.costPrice
        }
        return totalDetail - totalCost
    }
    
    func getTotalSold() -> Int64 {
        var totalSold: Int64 = 0
        
        for data in ProductSoldModel.shared.getAllDetail() {
            totalSold += data.quantity
        }
        return totalSold
    }
}
