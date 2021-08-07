//
//  ComplexPieChartLegend.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

struct ComplexPieChartLegend: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 6) {
                Circle()
                    .foregroundColor(Color.orange)
                    .frame(width: 16, height: 16)
                    .padding(3)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 12) {
                        Text("20% Utilities")
                            .font(Font.custom("SFProDisplay-Semibold", size: 18))
                        HStack {
                            Image(systemName: "arrow.up")
                                .padding(.trailing, -8)
                                .font(Font.custom("SFProDisplay-Semibold", size: 14).bold())
                            Text("Rp 120.000")
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                        }
                        .foregroundColor(.green)
                    }
                    HStack(spacing: 4) {
                        Text("^ 3% Utilities ")
                            .foregroundColor(.green)
                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                        Text("from lash month")
                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                    }
                }
            }
        }
    }
}

struct ComplexPieChartLegend_Previews: PreviewProvider {
    static var previews: some View {
        ComplexPieChartLegend()
    }
}
