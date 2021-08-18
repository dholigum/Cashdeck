//
//  ExpenseTipsCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct ExpenseTipsCard: View {
    
    @StateObject var overviewExpenseVM = OverviewExpenseViewModel()
    
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

                ForEach(overviewExpenseVM.expenseTips, id:\.self) { tips in
                    if tips != "" {
                        HStack(alignment: .top) {
                            Circle()
                                .frame(width: 4, height: 4)
                                .padding(.top, 5)
                            Text(tips)
                                .font(Font.custom("SFProDisplay-Reguler", size: 16))
                                .padding(.vertical, 2)
                                .lineSpacing(6)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
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
