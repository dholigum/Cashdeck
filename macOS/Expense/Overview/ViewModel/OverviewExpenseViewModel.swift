//
//  OverviewExpenseViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

class OverviewExpenseViewModel: ObservableObject {
    
    @Published var isOpenCalendar = false
    @Published var yearIndex = 21
    @Published var monthIndex = 0
    
    @Published var expenses: [Expense] = []
    @Published var groupedExpense: [SimpleExpense] = []
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func formatedMonthYear() -> String {
        let realYear = 2000 + yearIndex
        let realMonth = K().monthName[monthIndex]
        
        return "\(realMonth) \(realYear)"
    }
    
    func getMonthlyGroupedExpense() {
        
        var dateComp = DateComponents()
        dateComp.year = yearIndex + 2000
        dateComp.month = monthIndex + 1 // In datecomponents, month start from 1
        dateComp.day = 1

        let calendar = Calendar.current
        let firstDayOfTheMonth = calendar.date(from: dateComp)

        var oneMonth = DateComponents()
        oneMonth.month = 1
        let beginningOfNextMonth = calendar.date(byAdding: oneMonth, to: firstDayOfTheMonth!)
        
        let predicate = NSPredicate(format: "%K >= %@ && %K < %@", "date", firstDayOfTheMonth! as NSDate, "date", beginningOfNextMonth! as NSDate)
        
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            expenses = try context.fetch(fetchRequest)
            
            for expense in expenses {
                print(expense.name, expense.category)
            }
//            totalExpense = Int(expenses.reduce(0) { $0 + $1.price })
//
//            for expense in expenses {
//                let newSimpleExpense = SimpleExpense(name: expense.category ?? "", cost: Double(expense.price ?? 0))
//
//                simpleExpenses.append(newSimpleExpense)
//            }
//
//            groupedExpense = simpleExpenses.grouped()
            
        } catch let error as NSError {
            print("\(error)")
        }
    }
}
