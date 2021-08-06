//
//  BusinessGrowthCard.swift
//  Cashdeck (iOS)
//
//  Created by Shiddiq Syuhada on 06/08/21.
//

import SwiftUI

struct BusinessGrowthCard: View {
    var body: some View {
        VStack {
            Text("Business Growth")
        }
        .frame(width: 410, height: 168)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)

    }
}

struct BusinessGrowthCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessGrowthCard()
    }
}
