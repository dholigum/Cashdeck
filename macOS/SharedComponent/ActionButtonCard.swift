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
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(Color("TabButtonColor"))
                .font(.system(size: 16))
            Text(title)
                .font(Font.title3.weight(.medium))
        }
        .frame(height: 44)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct ActionButtonCard_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonCard(icon: "house", title: "Home")
    }
}
