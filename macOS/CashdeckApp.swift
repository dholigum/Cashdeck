//
//  CashdeckApp.swift
//  Shared
//
//  Created by Syahrul Apple Developer BINUS on 21/07/21.
//

import SwiftUI

@main
struct CashdeckApp: App {
    
    init() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count - 1] as URL)
//        ProductSoldModel.shared.insertProduct(name: "Hoodie Green", SKU: "STEEGREEN", color: "GREEN", size: "M", costPrice: 110000)
//        ProductSoldModel.shared.insertTransactionDetail(price: 175000, qty: 10, product: ProductSoldModel.shared.getProduct(sku: "STEEGREEN"), transaction: ProductSoldModel.shared.insertTransaction(channel: ProductSoldModel.shared.getChannel(name: "Tokopedia")))
      
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .background(Color("MainColor"))
                .preferredColorScheme(.light)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
