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
    
    var body: some View {
        VStack(spacing: 5){
            RoundedRectangle(cornerRadius: 5)
                .fill(barColor)
                .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
            Text(labels).font(.system(size: 9))
        }
        
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCell(value: 300, barColor: .blue, labels: "Day")
            .previewLayout(.sizeThatFits)
    }
}
