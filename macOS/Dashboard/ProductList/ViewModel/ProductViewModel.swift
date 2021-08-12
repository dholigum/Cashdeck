//
//  ProductViewModel.swift
//  Cashdeck (iOS)
//
//  Created by Azrullah Kainage on 10/08/21.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var listProducts: [Products] = [Products]()
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    
    public func fetchProducts() {
        do {
            self.listProducts = try context.fetch(Products.fetchRequest())
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    public func addProduct(_ Product: ProductModel) {
        let newProduct = Products(context: self.context)
        newProduct.sku = Product.SKU
        newProduct.name = Product.name
        newProduct.costPrice = Product.costPrice
        newProduct.size = Product.size
        newProduct.color = Product.color
        fetchProducts()
        do {
            try self.context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
