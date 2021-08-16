//
//  CurrencyFormattedTextField.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 05/08/21.
//

import SwiftUI

struct CurrencyFormattedTextField: NSViewRepresentable {
    
    @Binding var formatted: String
    @Binding var rawValue: String
    
    func updateNSView(_ uiView: NSTextField, context: Context) {
        uiView.stringValue = formatted
    }
    
    func makeNSView(context: Context) -> NSTextField {
        
        let textField = NSTextField()
        textField.delegate = context.coordinator
        
        return textField
    }
    
    func makeCoordinator() -> CurrencyFormattedTextFieldDelegate {
        CurrencyFormattedTextFieldDelegate(formatted: $formatted, rawValue: $rawValue)
    }
}

class CurrencyFormattedTextFieldDelegate: NSObject, NSTextFieldDelegate {
    
    @Binding var formatted: String
    @Binding var rawValue: String
    
    init(formatted: Binding<String>, rawValue: Binding<String>) {
        _formatted = formatted
        _rawValue = rawValue
    }
    
    func textField(_ textField: NSTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        rawValue = rawValue.appending(string)
        
        guard let integerValue = Int(rawValue) else { return true }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "Rp."
        formatted = numberFormatter.string(from: NSNumber(value: integerValue)) ?? ""
        
        return true
    }
    
    func textFieldShouldClear(_ textField: NSTextField) -> Bool {
        
        return true
    }
}
