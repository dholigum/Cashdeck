//
//  TotalNetIncome.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import SwiftUI

struct TotalNetIncome: View {
    
    let productSoldVM = ProductSoldViewModel()
    
    var body: some View {
        VStack (spacing: 8) {
            Text("Total Net Income")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(.black)
            
            Text("Rp \(productSoldVM.getTotalNetIncome())")
                .font(Font.custom("SFProDisplay-Semibold", size: 36))
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 294, height: 101.06)
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct TotalNetIncome_Previews: PreviewProvider {
    static var previews: some View {
        TotalNetIncome()
    }
}
