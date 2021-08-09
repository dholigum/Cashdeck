//
//  HomeAnalytics.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 09/08/21.
//

import SwiftUI

struct HomeAnalytics: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            Text("Overview")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .foregroundColor(Color("AccentColor2"))
            
            VStack (alignment: .leading, spacing: 18){
                HomeAnalyticsCard(title: "Chart", legend: "IDR", barColor: .blue, data: chartDataSet)
            }
//            .frame(width: 1000, height: 700)
//            .background(Color.white)
//            .cornerRadius(16)
//            .clipped()
//            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
//            .padding(.horizontal, 2)
        }
        

    }
}

struct HomeAnalytics_Previews: PreviewProvider {
    static var previews: some View {
        HomeAnalytics()
    }
}
