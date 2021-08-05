//
//  RecentExpenseTableCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct RecentExpenseTableCard: View {
    
    var expenseData: [Expense]
    
    var dateFormatter: DateFormatter {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("RecentExpenseTableCard")
            
            List {
                ForEach(expenseData) { expense in
                    HStack(spacing: 10) {
                        Text(dateFormatter.string(from: expense.date!))
                        Text(expense.name ?? "-")
                        Text("\(expense.quantity )")
                        Text("\(expense.price )")
                    }
                }
            }
            
            Spacer()
        }
        .frame(width: 1012, height: 597)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}
