//
//  TotalSold.swift
//  Cashdeck
//
//  Created by Revarino Putra on 03/08/21.
//

import SwiftUI

struct TotalSold: View {
    let productSoldVM = ProductSoldViewModel()
    
    var body: some View {
        VStack (spacing: 8) {
            Text("Product Sold")
                .font(Font.custom("SFProDisplay-Semibold", size: 18))
                .foregroundColor(.black)
            
            Text("\(productSoldVM.getTotalSold())")
                .font(Font.custom("SFProDisplay-Semibold", size: 36))
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 185, height: 101.06, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct TotalSold_Previews: PreviewProvider {
    static var previews: some View {
        TotalSold()
    }
}
