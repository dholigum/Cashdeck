//
//  ActionButtonCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ActionButtonCard: View {
    
    let icon: String
    let title: String
    var defaultColor: Color = Color.white
    
    @Binding var isPressed: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(Color("OrangeColor"))
                .font(.system(size: 16))
            Text(title)
                .font(Font.title3.weight(.medium))
        }
        .frame(height: 44)
        .padding(.horizontal)
        .background(isPressed ? Color("TapedMenuColor") : defaultColor )
        .cornerRadius(12)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}
