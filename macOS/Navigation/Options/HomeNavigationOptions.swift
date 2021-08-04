//
//  HomeNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct HomeNavigationOptions {
    
    enum OptionType { case overview, analytics, productList, productSold }
    typealias Option = (id: UUID, value: String, image: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Overview", "home-overview", .overview),
        (UUID(), "Analytics", "home-analytics", .analytics),
        (UUID(), "Product List", "product-list", .productList),
        (UUID(), "Product Sold", "product-sold", .productSold),
    ]
    
    @ViewBuilder
    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .overview:
            HomeOverview()
        case .analytics:
            HomeOverview()
        case .productList:
            PieChartView(values: [1300, 500, 300], names: ["Rent", "Transport", "Education"], formatter: {value in String(format: "$%.2f", value)})
        case .productSold:
            Text("Main Option selected\n\(option.value)")
        }
    }
}
