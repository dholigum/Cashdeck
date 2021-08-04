//
//  ProductSoldModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import Foundation
import CoreData

class ProductSoldModel {
    static let shared = ProductSoldModel()
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func insertProduct(name: String, SKU: String, color: String, size: String, costPrice: Int) {
        let newProduct = Products(context: self.context)
        newProduct.sku = SKU
        newProduct.name = name
        newProduct.color = color
        newProduct.size = color
        newProduct.costPrice = Int64(costPrice)
        CoreDataManager.sharedManager.saveContext()
    }
    
    func insertTransactionDetail(price: Int64, qty: Int64) {
        let newTransactionDetail = TransactionDetail(context: self.context)
        newTransactionDetail.price = price
        newTransactionDetail.quantity = qty
        
//        newTransactionDetail.td_product =
        
    }
    
    func connectTDProduct(td: TransactionDetail, product: Products) {
        td.td_product = product
    }
}
