//
//  PieChartLegend.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

@available(OSX 10.15, *)
struct PieChartLegend: View {
    
    var colors: [Color]
    var names: [String]
    var values: [Double]
    var percents: [String] {
        return self.values.map { String(format: "%.2f%%", $0 * 100 / values.reduce(0, +)) }
    }
    
    public init(values: [Double], names: [String], colors: [Color] = [Color.blue, Color.green, Color.orange, Color.purple, Color.gray, Color.yellow, Color.red, Color.blue, Color.green, Color.orange, Color.purple, Color.gray, Color.yellow, Color.red]){
        
        self.values = values
        self.names = names
        self.colors = Array(colors.prefix(upTo: self.values.count))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<self.values.count){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colors[i])
                        .frame(width: 20, height: 20)
                    Text(self.percents[i])
                    Text(self.names[i])
                }
            }
        }
    }
}
