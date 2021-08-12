//
//  productController.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 09/08/21.
//

import Foundation
import SwiftUI

extension ModalAddProduct {
    func downloadTemplate () {
        let savePanel = NSSavePanel()
            savePanel.canCreateDirectories = true
            savePanel.showsTagField = false
            savePanel.nameFieldStringValue = "Product Template.xlsx"
            savePanel.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
            savePanel.begin { (result) in
                if (savePanel.runModal() == NSApplication.ModalResponse.OK) {
//                    let result = savePanel.url
                    
                } else {
                    // handle user clicking "cancel"
                    print("Masuk else")
                }
            }
    }
}
