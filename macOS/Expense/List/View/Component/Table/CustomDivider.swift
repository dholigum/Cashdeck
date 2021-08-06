//
//  CustomDivider.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 05/08/21.
//

import SwiftUI

struct CustomDivider: View {
    
    let width: CGFloat
    let height: CGFloat = 1
    let color: Color = .gray
    let opacity: Double = 0.2
    
    var body: some View {
        Group {
            Rectangle()
        }
        .frame(width: width, height: height)
        .foregroundColor(color)
        .opacity(opacity)
    }
}
