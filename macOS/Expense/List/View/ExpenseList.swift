//
//  ExpenseList.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct ExpenseList: View {
    
    @State private var showAddExpenseSheet = false
    @ObservedObject var expenseListViewModel = ExpenseListViewModel()
    
    init() {
        expenseListViewModel.getAllExpense()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense List")
                .font(Font.custom("SFProDisplay-Bold", size: 24))
                .padding(.bottom)
                .foregroundColor(Color("AccentColor2"))
            
            CashInformationCard(title: "Total Expense", cashInfo: "Rp 2.130.000")
            ActionButtonCard(icon: "plus.circle", title: "Add Expense", isPressed: $showAddExpenseSheet)
                .onTapGesture {
                    self.showAddExpenseSheet = true
                }
                .sheet(isPresented: $showAddExpenseSheet) {
                    AddExpenseSheet(expenseListViewModel: expenseListViewModel, isVisible: $showAddExpenseSheet)
                }
            RecentExpenseTableCard(expenseData: expenseListViewModel.expenses)
        }
        .padding(.top, -48)
        .padding(.horizontal, 4)
    }
}

struct ExpenseList_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseList()
    }
}
