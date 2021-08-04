//
//  ProductSoldViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 04/08/21.
//

import Foundation

class ProductSoldViewModel {
    var soldData = [TransactionDetail]()
    
    init() {
        fetchAll()
    }
    
    func fetchAll() {
        self.soldData = ProductSoldModel.shared.getAllDetail()
    }
    
}
