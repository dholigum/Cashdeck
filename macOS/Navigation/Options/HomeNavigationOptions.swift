//
//  HomeNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct HomeNavigationOptions {
    
    enum OptionType { case overview, analytics, productList, productSold }
    typealias Option = (id: UUID, value: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Overview", .overview),
        (UUID(), "Analytics", .analytics),
        (UUID(), "Product List", .productList),
        (UUID(), "Product Sold", .productSold),
    ]

    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .overview:
            return Text("Main Option selected\n\(option.value)")
        case .analytics:
            return Text("Main Option selected\n\(option.value)")
        case .productList:
            return Text("Main Option selected\n\(option.value)")
        case .productSold:
            return Text("Main Option selected\n\(option.value)")
        }
    }
}
