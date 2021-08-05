//
//  ExpenseNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct ExpenseNavigationOptions {
    
    enum OptionType { case overview, analytics, expenseList }
    typealias Option = (id: UUID, value: String, image: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Overview", "expense-overview", .overview),
        (UUID(), "Analytics", "expense-analytics", .analytics),
        (UUID(), "Expense List", "expense-list", .expenseList),
    ]
    
    @ViewBuilder
    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .overview:
            ExpenseOverview()
        case .analytics:
            Text("Main Option selected\n\(option.value)")
        case .expenseList:
            ExpenseList()
        }
    }
}
