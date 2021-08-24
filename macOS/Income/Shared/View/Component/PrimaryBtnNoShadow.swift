//
//  PrimaryBtnNoShadow.swift
//  Cashdeck
//
//  Created by Revarino Putra on 24/08/21.
//

import SwiftUI

struct primaryBtnNoShadow: View {
    var imageName: String
    var title: String
    var width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18)
                .foregroundColor(Color.orange)
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
            }
        }
        .frame(width: width, height: 44)
        .background(Color.white)
        .cornerRadius(10)
        .clipped()
    }
}

