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
                .foregroundColor(selectedTabButton == title ? .white : Color("OrangeColor"))
                .padding(.horizontal)
                .frame(width: 16)
            
            Text(title)
                .font(Font.title3.weight(.medium))
        }
    }
}
