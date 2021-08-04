//
//  CardMenuButton.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 30/07/21.
//

import SwiftUI

struct CardMenuButton: View {
    
    var title: String
    var imageName: String
    
    @Binding var selectedMenu: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
            
            HStack {
                Text(title)
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .padding(.vertical)
                    .padding(.leading)
                
                Spacer()
            }
            
        }
        .frame(width: 198, height: 62)
        .background(selectedMenu == title ? Color("TapedMenuColor") : Color.white )
        .cornerRadius(10)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}
