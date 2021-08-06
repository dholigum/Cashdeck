//
//  TotalNetIncome.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import SwiftUI

struct TotalNetIncome: View {
    var body: some View {
        VStack (spacing: 8) {
            Text("Total Net Income")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(.black)
            
            Text("Rp 5.390.000")
                .font(Font.custom("SFProDisplay-Semibold", size: 36))
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 294, height: 101.06)
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
    }
}

struct TotalNetIncome_Previews: PreviewProvider {
    static var previews: some View {
        TotalNetIncome()
    }
}
