//
//  HomeAnalytics.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 09/08/21.
//

import SwiftUI

struct HomeAnalytics: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 18){
                Text("Overview")
                    .font(Font.custom("SFProDisplay-Bold", size: 24))
                    .foregroundColor(Color("AccentColor2"))
                
                VStack (alignment: .leading, spacing: 18){
                    HomeAnalyticsCard(title: "Chart", legend: "IDR", barColor: .blue, data: chartDataSet)
                }
            }
            .frame(width: geometry.frame(in: .global).size.width, height: geometry.frame(in: .global).size.height, alignment: .leading)
            .padding(.leading, 12)
        }

    }
}

struct HomeAnalytics_Previews: PreviewProvider {
    static var previews: some View {
        HomeAnalytics()
    }
}
