//
//  ExpenseNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct ExpenseNavigationOptions {
    
    enum OptionType { case overview, analytics, expenseList }
    typealias Option = (id: UUID, value: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Overview", .overview),
        (UUID(), "Analytics", .analytics),
        (UUID(), "Expense List", .expenseList),
    ]

    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .overview:
            return Text("Main Option selected\n\(option.value)")
        case .analytics:
            return Text("Main Option selected\n\(option.value)")
        case .expenseList:
            return Text("Main Option selected\n\(option.value)")
        }
    }
}
