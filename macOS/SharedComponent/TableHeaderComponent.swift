//
//  TableHeaderComponent.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 20/08/21.
//

import SwiftUI

struct TableHeaderComponent: View {
    
    let title: String
    let padding: CGFloat
    let width: CGFloat
    
    var body: some View {
        Text(title)
            .font(Font.custom("SFProDisplay-Semibold", size: 16))
            .padding(padding)
            .frame(width: width, alignment: .leading)
    }
}
