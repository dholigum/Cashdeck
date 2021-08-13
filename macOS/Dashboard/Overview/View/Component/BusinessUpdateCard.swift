//
//  BusinessUpdateCard.swift
//  Cashdeck
//
//  Created by Revarino Putra on 08/08/21.
//

import SwiftUI

struct BusinessUpdateCard: View {
    
    let businessUpdateVM = BusinessUpdateViewModel.shared
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Business Update")
                .font(Font.custom("SFProText-Bold", size: 17))
                .foregroundColor(Color("AccentColor2"))
                .padding(.bottom, 8)
            
            Text(businessUpdateVM.isGrowth())
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .padding(.bottom, 16)
            
            VStack (alignment: .leading){
                Text("If possible, increase your most selling product")
                    .font(Font.custom("SFProDisplay-Regular", size: 18))
                HStack{
                    Text(businessUpdateVM.mostSellingProduct())
                        .font(Font.custom("SFProDisplay-semibold", size: 18))
                        .foregroundColor(Color("AccentColor3"))
                    Text("to improve profit next month")
                        .font(Font.custom("SFProDisplay-Regular", size: 18))
                }
            }
        }
        .padding()
        .frame(width: 410, height: 198)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct BusinessUpdateCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessUpdateCard()
    }
}
