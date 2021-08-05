//
//  StringFormatter.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import Foundation

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 3
            formatter.minimumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
