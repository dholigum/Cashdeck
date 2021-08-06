//
//  CardSummary.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 06/08/21.
//

import SwiftUI

struct CardSummary: View {
    @State var title: String
    @State var value: String
    var body: some View {
        VStack {
            Text("Total Product")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Text("20")
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 185, height: 100)
        .background(Color.white)
        .cornerRadius(15)
        .padding(10)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}
