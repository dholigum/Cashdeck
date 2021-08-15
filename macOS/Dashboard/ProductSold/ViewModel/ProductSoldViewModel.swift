//
//  ProductSoldViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import Foundation

class ProductSoldViewModel {
    var productSold = [ProductSold]()

    init() {
        let products = ProductSoldModel.shared.getAllProduct()
        for product in products {
            var newProductSold = ProductSold()
            newProductSold.sku = product.sku!
            newProductSold.name = product.name!
            newProductSold.color = product.color!
            newProductSold.size = product.size!
            if calculateQty(product: product) == 0 { continue }
            newProductSold.quantity = calculateQty(product: product)
            newProductSold.netIncome = getNetIncome(product: product)
            productSold.append(newProductSold)
            productSold.sort { $0.quantity > $1.quantity }
        }
    }
    
    func calculateQty(product: Products) -> Int64 {
        var totalQty: Int64 = 0
        let details = ProductSoldModel.shared.getAllDetail().filter { $0.td_product == product }
        
        for detail in details {
            totalQty += detail.quantity
        }
        return totalQty
    }
    
    func getNetIncome(product: Products) -> Int64 {
        var totalSellingPrice: Int64 = 0
        let detail = ProductSoldModel.shared.getAllDetail().filter { $0.td_product == product }
        let totalQty = calculateQty(product: product)
        totalSellingPrice = detail[0].price * totalQty
        let costPrice = totalQty * product.costPrice
        
        return totalSellingPrice - costPrice
    }
    
    func getTotalNetIncome() -> Int64 {
        var total: Int64 = 0
        
        for net in productSold {
            total += net.netIncome
        }
        return total
    }
    
    func getTotalSold() -> Int64 {
        var total: Int64 = 0
        
        for product in productSold {
            total += product.quantity
        }
        return total
    }
}
