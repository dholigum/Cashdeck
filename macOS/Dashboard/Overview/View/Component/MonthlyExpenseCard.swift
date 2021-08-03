//
//  MonthlyExpenseCard.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct MonthlyExpenseCard: View {
    
    let dataValues: [Double] = [30, 24, 21, 13, 12]
    let dataLabels: [String] = ["Utilities", "Transport", "Housing", "Personal", "Finance"]
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Monthly Expense")
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            HStack {

                PieChartView(values: dataValues, names: dataLabels, formatter: {value in String(format: "Rp %.0f", value)})
                    .frame(width: 300, height: 300)
                
                PieChartLegend(values: dataValues, names: dataLabels)
            }
            .padding(.top, -16)
            .padding(.leading, -24)
            
            Spacer()
        }
        .frame(width: 490, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .padding(.horizontal, 2)
    }
}

struct MonthlyExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyExpenseCard()
    }
}
