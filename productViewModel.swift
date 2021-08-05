//
//  productViewModel.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

class ProductviewModel: ObservableObject {
    @Published var listProducts = [Products]()
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func fetchProducts () {
        do {
            self.listProducts = try context.fetch(Products.fetchRequest())
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
