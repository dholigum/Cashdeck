//
//  CardReports.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 03/08/21.
//

import SwiftUI

struct CardReports: View {
    var title: String
    var value: String
    var percent: Int
    var width: CGFloat
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18))
            Text(value)
                .font(.system(size: 36))
                .foregroundColor(Color("AccentColor2"))
                .fontWeight(.semibold)
            HStack {
                if percent < 0 {
                    Text("\(percent)%")
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                } else {
                    Text("\(percent)%")
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                }
                Text("from last month")
                    .font(.system(size: 14))
            }
        }
        .frame(width: width, height: 124)
        .background(Color.white)
        .cornerRadius(10)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}
