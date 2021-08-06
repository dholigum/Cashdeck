//
//  TotalExpenseInfoCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 06/08/21.
//

import SwiftUI

struct TotalExpenseInfoCard: View {
    
    let title: String

    @StateObject var expenseVM = ExpenseViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(Font.title3.weight(.medium))
            Text(String(expenseVM.totalExpense).currencyFormatting())
                .font(Font.system(size: 36).weight(.semibold))
                .foregroundColor(Color("AccentColor2"))
        }
        .frame(width: 294, height: 102)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
        .onAppear() { expenseVM.getAllExpense() }
    }
}
