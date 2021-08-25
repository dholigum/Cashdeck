//
//  SideBarButton.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct SideBarButton: View {
    
    var iconImg: String
    var title: String
    
    @Binding var selectedTabButton: String
    
    var body: some View {
        HStack {
            Image(systemName: iconImg)
                .font(.system(size: 16))
                .foregroundColor(Color("OrangeColor"))
                .padding(.horizontal)
                .padding(.leading)
                .frame(width: 16)
            
            Text(title)
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .padding(.horizontal, 6)
            
            Spacer()
        }
        .frame(width: 186, height: 28)
        .background(selectedTabButton == title ? Color("MainColor") : Color("AccentColor") )
        .cornerRadius(4)
        .clipped()
        .padding(.horizontal)
        .padding(.vertical, 1)
    }
}
