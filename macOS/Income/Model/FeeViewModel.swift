//
//  FeeViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 07/08/21.
//

import Foundation
import SwiftUI

class FeeViewModel: ObservableObject {
    
    @Published var productFee: String = ""
    @Published var shippingFee: String = ""
    @Published var maxShippingFee: String = ""
    @StateObject var transVM = TransactionViewModel.shared
    init() {
        let channel =  FeeModel.shared.getChannel(name: "Tokopedia")
        productFee = String(channel.productFee)
        shippingFee = String(channel.shippingFee)
        maxShippingFee = String(channel.maxShippingFee)
    }
    
    func editFee() {
        let channel = FeeModel.shared.getChannel(name: "Tokopedia")
        FeeModel.shared.editFee(choosedChannel: channel, productFee: Double(productFee)!, shippingFee: Double(shippingFee)!, maxShippingFee: Int64(maxShippingFee)!)
        transVM.fetchData()
    }
    
}
