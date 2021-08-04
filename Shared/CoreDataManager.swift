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
}
