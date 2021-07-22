//
//  TabButton.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 22/07/21.
//

import SwiftUI

var blackTransparent = Color.black.opacity(0.5)

struct TabButton: View {
    
    var iconImage: String
    var title: String
    
    @Binding var selected: String
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            HStack {
                Image(systemName: iconImage)
                    .font(.title)
                    .foregroundColor(selected == title ? Color.black : blackTransparent)
                    .frame(width: 25)
                
                Text(title)
                    .fontWeight(selected == title ? .bold : .none)
                    .foregroundColor(selected == title ? Color.black : blackTransparent)
                    .animation(.none)
                
                Spacer()
            }
            .padding(.horizontal)
        })
        .buttonStyle(PlainButtonStyle())
    }
}
