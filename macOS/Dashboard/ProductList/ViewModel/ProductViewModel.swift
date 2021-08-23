//
//  ProductViewModel.swift
//  Cashdeck (iOS)
//
//  Created by Azrullah Kainage on 10/08/21.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    
    static let shared: ProductViewModel = ProductViewModel()
    @Published var listProducts: [Products] = [Products]()
    @Published var totalProducts: Int = 0
    @Published var totalQuantity: Int = 0
    var sku: String = ""
    var name: String = ""
    var color: String = ""
    var size: String = ""
    var qty: Int = 0
    var cost: Int = 0
    
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    
    func fetchProducts() {
        do {
            listProducts = try context.fetch(Products.fetchRequest())
            totalProducts = listProducts.count
            totalQuantity = Int(listProducts.reduce(0) { $0 + $1.quantity })
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func addProduct(_ Product: ProductModel) {
        let newProduct = Products(context: self.context)
        newProduct.sku = Product.SKU
        newProduct.name = Product.name
        newProduct.costPrice = Product.costPrice
        newProduct.size = Product.size
        newProduct.color = Product.color
        newProduct.quantity = Product.quantity
        fetchProducts()
        do {
            try self.context.save()
            listProducts.append(newProduct)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteProduct(_ product: Products) {
        
        totalProducts -= 1
        totalQuantity -= Int(product.quantity)
        CoreDataManager.sharedManager.deleteContext(product)
        
        if let index = listProducts.firstIndex(of: product) {
            listProducts.remove(at: index)
        }
    }
}
