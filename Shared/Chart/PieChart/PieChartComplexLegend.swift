//
//  PieChartComplexLegend.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct PieChartComplexLegend: View {
    
    var colors: [Color]
    var names: [String]
    var values: [Double]
    var oldValues: [Double]
    var isAllZeroValues: Bool {
        return self.values.allSatisfy { $0 == 0 }
    }
    var percents: [String] {
        return self.values.map { String(format: "%.2f%%", $0 * 100 / values.reduce(0, +)) }
    }
    var differences: [Double] {
        return zip(values, oldValues).map { $0 - $1 }
    }
    var isIncrease: [Bool] {
        return self.differences.map { $0 > 0 }
    }
    var pnctageDiff: [Double] {
        return zip(values, oldValues).map {
            if ($0 - $1) > 0 { return abs($0 - $1) / $0 }
            else if ($0 - $1) < 0 { return abs($1 - $0) / $1 }
            else { return 0.0 } }
    }
    
    public init(values: [Double], oldValues: [Double], names: [String], colors: [Color] = [Color.blue, Color.green, Color.orange, Color.purple, Color.gray, Color.yellow, Color.red, Color.blue, Color.green, Color.orange, Color.purple, Color.gray, Color.yellow, Color.red]){
        
        self.values = values
        self.oldValues = oldValues
        self.names = names
        self.colors = Array(colors.prefix(upTo: self.values.count))
    }
    
    var body: some View {
        if !isAllZeroValues {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<self.values.count) { i in
                    if self.percents[i] != "0.00%" {
                        HStack(alignment: .top, spacing: 6) {
                            Circle()
                                .foregroundColor(self.colors[i])
                                .frame(width: 16, height: 16)
                                .padding(3)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 12) {
                                    Text("\(self.percents[i]) \(self.names[i])")
                                        .font(Font.custom("SFProDisplay-Semibold", size: 18))
                                    HStack {
                                        Image(systemName: self.isIncrease[i] ? "arrow.up" : "arrow.down")
                                            .padding(.trailing, -6)
                                            .font(Font.custom("SFProDisplay-Semibold", size: 14).bold())
                                        Text(String(self.differences[i]).currencyFormatting())
                                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    }
                                    .foregroundColor(self.isIncrease[i] ? .green : .red)
                                }
                                HStack(spacing: 4) {
                                    Text("\(String(format: "%.2f", self.pnctageDiff[i] * 100))%")
                                        .foregroundColor(self.isIncrease[i] ? .green : .red)
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    Text("from last month")
                                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                                }
                            }
                        }
                    }
                }
            }
        } else {
            VStack {
                Text("Ups.. No Data in this Month!")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                Text("Try to add some data in Expense List Menu")
                    .font(Font.custom("SFProDisplay-Regular", size: 14))
            }
            .padding(.top, -8)
        }
    }
}
