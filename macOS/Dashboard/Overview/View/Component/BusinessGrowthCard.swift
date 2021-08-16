//
//  BusinessGrowthCard.swift
//  Cashdeck
//
//  Created by Revarino Putra on 08/08/21.
//

import SwiftUI

struct BusinessGrowthCard: View {
    
    let businessVM = BusinessUpdateViewModel.shared
    
    var body: some View {
        HStack (spacing: 10){
            LineView(data: businessVM.calculateFixIncomePerDay(), title: "Business Growth", style: ChartStyle(backgroundColor: .white, accentColor: Color("AccentColor2"), secondGradientColor: Color("AccentColor2"), textColor: Color("AccentColor2"), legendTextColor: .red, dropShadowColor: .red), legendSpecifier: "")
                .padding(.bottom, 200)
        
            VStack (alignment: .trailing, spacing: 6) {
                Text("Daily Update")
                    .font(Font.custom("SFProDisplay-Semibold", size: 11))
                Text(businessVM.getTodaysNetIncome())
                    .font(Font.custom("SFProDisplay-Semibold", size: 24))
                    .foregroundColor(Color("AccentColor3"))
                HStack (spacing: 4) {
                    Text(businessVM.getStatusName())
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                    Text(businessVM.getStatusPercent())
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .foregroundColor(Color(businessVM.getColor()))
                    Image(systemName: "chevron.up")
                        .foregroundColor(Color(businessVM.getColor()))
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .frame(width: 410, height: 200)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)

    }
}

struct BusinessGrowthCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessGrowthCard()
    }
}
