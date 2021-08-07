//
//  BusinessUpdateCard.swift
//  Cashdeck (iOS)
//
//  Created by Shiddiq Syuhada on 06/08/21.
//

import SwiftUI

struct BusinessUpdateCard: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Business Update")
                .font(Font.title.weight(.semibold))
                .padding(.vertical)
                .foregroundColor(Color("AccentColor2"))
                
                .padding(.leading, 20)
            Text("Your net income this month looks good. Keep it up to maintain your profit stability! \n If possible, increase your most selling product STEEBLACK to improve your profit next month")
        }
        .frame(width: 410, height: 198)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
    }
}

struct BusinessUpdateCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessUpdateCard()
    }
}
