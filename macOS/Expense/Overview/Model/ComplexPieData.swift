//
//  ComplexPieData.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import Foundation

class ComplexPieData {
    
    var category: String
    var thisMonthIndex: Int
    var prevMonthIndex: Int
    var thisMonthValue: Int
    var prevMonthValue: Int
    var difference: Int
    var percentage: Double
    var isIncrease: Bool
    
    init(category: String, thisMonthIdx: Int, prevMonthIdx: Int, thisMonthVal: Int, prevMonthVal: Int, difference: Int, percentage: Double, isIncrease: Bool) {
        self.category = category
        self.thisMonthIndex = thisMonthIdx
        self.prevMonthIndex = prevMonthIdx
        self.thisMonthValue = thisMonthVal
        self.prevMonthValue = prevMonthVal
        self.difference = difference
        self.percentage = percentage
        self.isIncrease = isIncrease
    }
}
