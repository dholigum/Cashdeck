//
//  AmountViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import SwiftUI

class AmountViewModel: ObservableObject {
    @Published var formattedAmount = ""
    @Published var amount = "" {
        didSet {
            let filtered = amount.filter { "0123456789".contains($0) }
            if filtered != amount {
                self.amount = filtered
            }
        }
    }
}
