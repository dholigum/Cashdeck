//
//  primaryBtn.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 03/08/21.
//

import SwiftUI

struct primaryBtn: View {
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
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.leading, 10)
    }
}
