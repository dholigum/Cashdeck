//
//  IncomeNavigationOptions.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct IncomeNavigationOptions {
    
    enum OptionType { case tokopedia, shopee }
    typealias Option = (id: UUID, value: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(), "Tokopedia", .tokopedia),
        (UUID(), "Shopee", .shopee)
    ]

    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .tokopedia:
            return Text("Main Option selected\n\(option.value)")
        case .shopee:
            return Text("Main Option selected\n\(option.value)")
        }
    }
}
