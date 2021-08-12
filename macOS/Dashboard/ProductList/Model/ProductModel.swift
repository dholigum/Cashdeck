//
//  ProductModel.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 10/08/21.
//

import SwiftUI

class ProductModel {
    var SKU: String
    var name: String
    var costPrice: Int64
    var size: String
    var color: String
    
    init(SKU: String, name: String, costPrice: Int64, size: String, color: String) {
        self.SKU = SKU
        self.name = name
        self.costPrice = costPrice
        self.size = size
        self.color = color
    }
}
