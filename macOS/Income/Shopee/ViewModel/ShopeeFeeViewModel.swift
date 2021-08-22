//
//  ShopeeFeeViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 22/08/21.
//

import Foundation
import SwiftUI

class ShopeeFeeViewModel: ObservableObject {
    
    @Published var productFee: String = ""
    @Published var shippingFee: String = ""
    @Published var maxShippingFee: String = ""
    @StateObject var transVM = TransactionViewModel.shared
    
    init() {
        let channel =  FeeModel.shared.getChannel(name: "Shopee")
        productFee = String(channel.productFee)
        shippingFee = String(channel.shippingFee)
        maxShippingFee = String(channel.maxShippingFee)
    }
    
    func editFee() {
        let channel = FeeModel.shared.getChannel(name: "Shopee")
        FeeModel.shared.editFee(choosedChannel: channel, productFee: Double(productFee)!, shippingFee: Double(shippingFee)!, maxShippingFee: Int64(maxShippingFee)!)
        transVM.fetchData(channel: "Shopee")
    }
    
}
