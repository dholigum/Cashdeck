//
//  ExpenseTipsCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ExpenseTipsCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Expense Tips")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .padding(EdgeInsets(top: 22, leading: 0, bottom: 2, trailing: 0))
                Text("Do you want to grow your business? Try some of these tips")
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.bottom, 16)
                
                Spacer()
            }
            .padding(.leading, 16)
            
            Spacer()
        }
        .frame(width: 600, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct ExpenseTipsCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTipsCard()
    }
}
