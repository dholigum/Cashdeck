//
//  CardSummaryGroup.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 14/08/21.
//

import SwiftUI

struct CardSummaryGroup: View {
    
    @StateObject var productVM: ProductViewModel
    
    var body: some View {
        HStack {
            CardSummary(title: "Total Product", value: String(productVM.totalProducts))
            CardSummary(title: "Total Quantity", value: String(productVM.totalQuantity))
        }
        .onAppear(perform: {
            productVM.fetchProducts()
        })
    }
}

