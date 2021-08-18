//
//  productController.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 09/08/21.
//

import Foundation
import SwiftUI
import CodableCSV

extension ModalAddProduct {
    func downloadTemplate () {
        let savePanel = NSSavePanel()
        savePanel.canCreateDirectories = true
        savePanel.showsTagField = false
        savePanel.nameFieldStringValue = "Product List Template.csv"
        savePanel.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
        savePanel.begin { (result) in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                
                let input = [
                    ["SKU", "Product Name", "Variant", "Size", "Quantity", "Cost Price"],
                    ["STEENAVY", "Champion X Reverse Weave Script Tee Japan Market", "Navy", "XL", "15", "100000"]
                ]
                
                let writer = try! CSVWriter(fileURL: savePanel.url!, append: false)
                for row in input {
                    try! writer.write(row: row)
                }
                try! writer.endEncoding()
                
            } else {
                print("cancel")
            }
        }
    }
}
