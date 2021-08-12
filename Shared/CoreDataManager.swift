//
//  CoreDataManager.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let sharedManager = CoreDataManager()
        
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CashdeckData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
        return container
    }()
    
    func insertInitData() {
        let channelTokped = ProductSoldModel.shared.insertChannel()
        ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEBLACK", color: "Black", size: "L", costPrice: 80000, quantity: 100)
        ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEWHITE", color: "White", size: "L", costPrice: 110000, quantity: 100)
        
        ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEBLACK", color: "Black", size: "L", costPrice: 80000, quantity: 100)
        ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEWHITE", color: "White", size: "L", costPrice: 110000, quantity: 100)
        let transaction1 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD001")
        let transaction2 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD002")
        let transaction3 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD003")
        let transaction4 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD004")
        let transaction5 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD005")
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction1)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction1)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction2)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction2)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction3)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction4)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction4)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction5)
        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction5)
    }
    
    func saveContext() {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteContext(_ object: NSManagedObject) {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        do {
            try context.delete(object)
            try context.save()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
