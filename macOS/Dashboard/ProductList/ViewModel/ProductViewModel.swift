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
    @Published var sku: String = ""
    @Published var name: String = ""
    @Published var color: String = ""
    @Published var size: String = ""
    @Published var qty: String = ""
    @Published var cost: String = ""
    @Published var isPresented: Bool = false
    @Published var choosedProduct = Products()
    
    
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
    
    func showEdit(product: Products) {
        choosedProduct = product
        guard let pSKU = product.sku, let pName = product.name, let pColor = product.color, let pSize = product.size else { return }
        sku = pSKU
        name = pName
        color = pColor
        size = pSize
        qty = String(product.quantity)
        cost = String(product.costPrice)
        isPresented.toggle()
    }
    
    func editProduct() {
        let data = choosedProduct
        data.sku = sku
        data.name = name
        data.color = color
        data.size = size
        data.quantity = Int64(qty) ?? 0
        data.costPrice = Int64(cost) ?? 0
        fetchProducts()
        
        CoreDataManager.sharedManager.saveContext()
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
