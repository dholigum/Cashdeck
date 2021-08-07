//
//  StringFormatter.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import Foundation

extension String {
    
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "Rp."
            formatter.maximumFractionDigits = 3
            formatter.minimumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}

extension Date {
    
    func dateFormatting() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        return formatter.string(from: self)
    }
    
    func shortDateFormatting() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
}
