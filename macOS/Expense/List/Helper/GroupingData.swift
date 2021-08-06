//
//  GroupingData.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 06/08/21.
//

import Foundation

extension Array where Element: SimpleExpense {
    
    func grouped() -> [SimpleExpense] {
        
        var items = [String: SimpleExpense]()
        
        for i in self {
            if let name = i.name {
                items[name] = (items[name] ?? SimpleExpense(name: name, cost: 0)) + i
            }
        }
        return items.map{$0.1}.sorted{$0.cost > $1.cost}
    }
}
