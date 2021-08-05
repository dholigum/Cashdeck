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
        newProduct.size = size
        newProduct.costPrice = Int64(costPrice)
        CoreDataManager.sharedManager.saveContext()
    }
    
    func insertTransactionDetail(price: Int64, qty: Int64, product: Products, transaction: Transaction) {
        let newTransactionDetail = TransactionDetail(context: self.context)
        newTransactionDetail.price = price
        newTransactionDetail.quantity = qty
        newTransactionDetail.td_product = product
        newTransactionDetail.td_transaction = transaction
        CoreDataManager.sharedManager.saveContext()
    }
    
    func insertTransaction(channel: Channel) -> Transaction {
        let newTransaction = Transaction(context: context)
        newTransaction.date = Date()
        newTransaction.transaction_channel = channel
        CoreDataManager.sharedManager.saveContext()
        return newTransaction
    }
    
    func insertChannel() -> Channel {
        let newChannel = Channel(context: context)
        newChannel.name = "Tokopedia"
        newChannel.maxShippingFee = 10000
        newChannel.productFee = 1.5
        newChannel.shippingFee = 2.5
        CoreDataManager.sharedManager.saveContext()
        return newChannel
    }
    
    func getProduct(sku: String) -> Products {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Products")
        fetchRequest.predicate = NSPredicate(format: "sku == %@", sku)
        do {
            let item = try context.fetch(fetchRequest)
            let data = item as! [Products]
            return data[0]
        }catch {
            print(error)
        }
        return Products()
    }
    
    func getAllDetail() -> [TransactionDetail] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TransactionDetail")
        
        do {
            let data = try context.fetch(fetchRequest) as! [TransactionDetail]
            return data
        }
        catch let error  as NSError {
            print("\(error)")
        }
        
        return []
    }
    
    func getChannel(name: String) -> Channel {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Channel")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do {
            let item = try context.fetch(fetchRequest)
            let data = item as! [Channel]
            return data[0]
        }catch {
            print(error)
        }
        return Channel()
    }
    
//    func getTransactionDetail(product: Products) -> [TransactionDetail] {
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TransactionDetail")
//        fetchRequest.predicate = NSPredicate(format: "td_product", product)
//        
//        do {
//            let data = try context.fetch(fetchRequest) as! [TransactionDetail]
//            return data
//        }
//        catch let error as NSError {
//            print("\(error)")
//        }
//        
//        return []
//    }
}
