//
//  BarChartCell.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 05/08/21.
//

import SwiftUI

struct BarChartCell: View {
    
    var value: Double
    var barColor: Color
    var labels: String
    var labelSize: CGFloat
        
    var body: some View {
        VStack(spacing: 0){
            if value < 0 {
                RoundedRectangle(cornerRadius: 5)
                    .fill(barColor)
                    .scaleEffect(CGSize(width: 0.8, height: 0), anchor: .bottom)
                RoundedRectangle(cornerRadius: 5)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("colorDown"), Color("DividerColor")]), startPoint: .top, endPoint: .bottom))
                    .scaleEffect(CGSize(width: 0.8, height: barHeight(val: value)), anchor: .top)
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .fill(LinearGradient(gradient: Gradient(colors: [barColor, Color("DividerColor")]), startPoint: .bottom, endPoint: .top))
                    .scaleEffect(CGSize(width: 0.8, height: barHeight(val: value)), anchor: .bottom)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("colorDown"))
                    .scaleEffect(CGSize(width: 0.8, height: 0), anchor: .top)
            }
            
            Text(labels).font(.system(size: labelSize))
        }
    }
    
    func barHeight(val: Double) -> Double {
        if val<0 {
            return val * -1
        } else {
            return val
        }
    }
    
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCell(value: 300, barColor: Color("AccentColor2"), labels: "Day", labelSize: 9)
            .previewLayout(.sizeThatFits)
    }
}
