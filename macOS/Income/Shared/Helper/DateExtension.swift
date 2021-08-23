//
//  NSDateExtension.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 14/08/21.
//

import Foundation

extension Date {
    var month: Int {
        return NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.component(.month, from: self as Date)
    }
    
    var year: Int {
        return NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.component(.year, from: self as Date)
    }
}
