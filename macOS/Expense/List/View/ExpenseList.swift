//
//  ExpenseList.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ExpenseList: View {
    
    @StateObject var expenseVM = ExpenseViewModel()
    
    var window = NSScreen.main?.visibleFrame
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense List")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.top, 20)
                .padding(.bottom)
                .foregroundColor(Color("AccentColor2"))
            
            TotalExpenseInfoCard(expenseVM: expenseVM)
            
            ActionButtonCard(icon: "plus.circle", title: "Add Expense", isPressed: $expenseVM.isNewData)
                .onTapGesture { expenseVM.isNewData.toggle() }
                .sheet(isPresented: $expenseVM.isNewData) { ExpenseSheet(expenseVM: expenseVM) }
            
            RecentExpenseTableCard(expenseVM: expenseVM)
        }
        .frame(minWidth: window!.width / 1.8, alignment: .leading)
        .padding(.leading, 12)
        
    }
}
