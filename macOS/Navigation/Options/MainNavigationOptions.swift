//
//  MainNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 20/08/21.
//

import SwiftUI

struct MainNavigationOptions {
    
    enum OptionType { case home, income, expense }
    typealias Option = (id: UUID, value: String, image: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Home", "house", .home),
        (UUID(), "Income", "scroll", .income),
        (UUID(), "Expense", "dollarsign.circle", .expense)
    ]
    
    @ViewBuilder
    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .home:
            MiddleBarMenu(seletedBar: "Home")
        case .income:
            MiddleBarMenu(seletedBar: "Income")
        case .expense:
            MiddleBarMenu(seletedBar: "Expense")
        }
    }
}
