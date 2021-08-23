//
//  FeeModel.swift
//  Cashdeck (macOS)
//
//  Created by Revarino Putra on 06/08/21.
//

import Foundation
import CoreData

class FeeModel {
    static let shared = FeeModel()
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func editFee(choosedChannel: Channel, productFee: Double, shippingFee: Double, maxShippingFee: Int64) {
        
        let data = choosedChannel
        data.productFee = productFee
        data.shippingFee = shippingFee
        data.maxShippingFee = maxShippingFee
        
        CoreDataManager.sharedManager.saveContext()
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
}
