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
        if (ProductSoldModel.shared.getAllProduct().isEmpty) {
            let channelTokped = ProductSoldModel.shared.insertChannel()
            ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEBLACK", color: "Black", size: "L", costPrice: 100000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Champion X Reverse Weave Script Tee Japan Market", SKU: "STEEWHITE", color: "White", size: "L", costPrice: 100000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Uniqlo Oversize BIllie Eilish Tee Original", SKU: "BILLIETEEB", color: "Black", size: "L", costPrice: 75000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Uniqlo Oversize BIllie Eilish Tee Original", SKU: "BILLIETEEW", color: "White", size: "L", costPrice: 75000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Uniqlo X Kaws Oversize Tee", SKU: "KAWSTEEB", color: "Black", size: "L", costPrice: 70000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Uniqlo X Kaws Oversize Tee", SKU: "KAWSTEEW", color: "White", size: "L", costPrice: 70000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Bape Oversize Tee", SKU: "BAPEBLACK", color: "Black", size: "L", costPrice: 80000, quantity: 100)
            ProductSoldModel.shared.insertProduct(name: "Bape Oversize Tee", SKU: "BAPEWHITE", color: "White", size: "L", costPrice: 80000, quantity: 100)
            let transaction1 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD001")
            let transaction2 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD002")
            let transaction3 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD003")
            let transaction4 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD004")
            let transaction5 = ProductSoldModel.shared.insertTransaction(channel: channelTokped, orderId: "ORD005")
            ProductSoldModel.shared.insertTransactionDetail(price: 200000, qty: 2, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction1)
            ProductSoldModel.shared.insertTransactionDetail(price: 200000, qty: 1, product: ProductSoldModel.shared.getProduct(sku: "STEEWHITE"), transaction: transaction1)
            ProductSoldModel.shared.insertTransactionDetail(price: 200000, qty: 2, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction2)
            ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 3, product: ProductSoldModel.shared.getProduct(sku: "KAWSTEEB"), transaction: transaction2)
            ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 1, product: ProductSoldModel.shared.getProduct(sku: "BILLIETEEB"), transaction: transaction3)
            ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 1, product: ProductSoldModel.shared.getProduct(sku: "BAPEBLACK"), transaction: transaction4)
            ProductSoldModel.shared.insertTransactionDetail(price: 200000, qty: 1, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction4)
            ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 1, product: ProductSoldModel.shared.getProduct(sku: "BILLIETEEB"), transaction: transaction5)
            ProductSoldModel.shared.insertTransactionDetail(price: 200000, qty: 2, product: ProductSoldModel.shared.getProduct(sku: "STEEBLACK"), transaction: transaction5)
            ProductSoldModel.shared.insertTransactionDetailTemp(orderId: "ORD006", price: 175000, productName: "Bape Oversize Tee Original", productSKU: "BAPEORIB", quantity: 2, channel: channelTokped)
            ProductSoldModel.shared.insertTransactionDetailTemp(orderId: "ORD006", price: 175000, productName: "Uniqlo Kaws Tee", productSKU: "UKAWSB", quantity: 1, channel: channelTokped)
            ProductSoldModel.shared.insertTransactionDetailTemp(orderId: "ORD007", price: 175000, productName: "Uniqlo Billie Eilish Tee Ori", productSKU: "BILTEEB", quantity: 2, channel: channelTokped)
            ProductSoldModel.shared.insertExpense(category: "Rent", name: "House Rent Fee", price: 800000, quantity: 1)
            ProductSoldModel.shared.insertExpense(category: "Marketing", name: "Product Advertisement", price: 50000, quantity: 5)
            ProductSoldModel.shared.insertExpense(category: "Packaging", name: "Bubble Wrap", price: 50000, quantity: 1)
            ProductSoldModel.shared.insertExpense(category: "Packaging", name: "Box", price: 40000, quantity: 10)
            ProductSoldModel.shared.insertExpense(category: "Utilities", name: "Wifi", price: 300000, quantity: 1)
            saveContext()
        }
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
