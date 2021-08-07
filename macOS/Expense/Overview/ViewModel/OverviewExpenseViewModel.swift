//
//  OverviewExpenseViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 07/08/21.
//

import SwiftUI

class OverviewExpenseViewModel: ObservableObject {
    
    @Published var isOpenCalendar = false
    @Published var yearIndex = Calendar.current.component(.year, from: Date()) - 2000
    @Published var monthIndex = Calendar.current.component(.month, from: Date()) - 1 
    
    @Published var expenses: [Expense] = []
    @Published var groupedDataLabels: [String] = []
    @Published var groupedDataValues: [Double] = []
    @Published var groupedPrevDataValues: [Double] = []
    
    @Published var showPieChart = false
    @Published var showPieChartLegend = false
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    var simpleExpenses: [SimpleExpense] = []
    
    func formatedMonthYear() -> String {
        let realYear = 2000 + yearIndex
        let realMonth = K().monthName[monthIndex]
        
        return "\(realMonth) \(realYear)"
    }
    
    func getMonthlyGroupedExpense() {
        
        let thisMonthPredicate = predicateGenerator(year: yearIndex, month: monthIndex)
        let prevMonthPredicate = predicateGenerator(year: yearIndex, month: monthIndex - 1 )
        
        let fetchRequestThisMonth: NSFetchRequest<Expense> = Expense.fetchRequest()
        fetchRequestThisMonth.predicate = thisMonthPredicate
        
        let fetchRequestPrevsMonth: NSFetchRequest<Expense> = Expense.fetchRequest()
        fetchRequestPrevsMonth.predicate = prevMonthPredicate
        
        do {
            expenses = try context.fetch(fetchRequestThisMonth)
            let prevExpenses = try context.fetch(fetchRequestPrevsMonth)
            
            simpleExpenses = expenses.map({ (expense: Expense) -> SimpleExpense in SimpleExpense(name: expense.category ?? "", cost: Double(expense.price )) })
            let simplePrevExpenses = prevExpenses.map({ (expense: Expense) -> SimpleExpense in SimpleExpense(name: expense.category ?? "", cost: Double(expense.price )) })
            
            let groupedPrevMonthDataLabels: [String]
            let groupedPrevMonthDataValues: [Double]
            
            if expenses.count == 0 {
                groupedDataLabels = []
                groupedDataValues = []
            } else {
                groupedDataLabels = simpleExpenses.grouped().map({ (expense: SimpleExpense) -> String in expense.name! })
                groupedDataValues = simpleExpenses.grouped().map({ (expense: SimpleExpense) -> Double in expense.cost })
            }
            
            if prevExpenses.count == 0 {
                groupedPrevMonthDataLabels = []
                groupedPrevMonthDataValues = []
            } else {
                groupedPrevMonthDataLabels = simplePrevExpenses.grouped().map({ (expense: SimpleExpense) -> String in expense.name! })
                groupedPrevMonthDataValues = simplePrevExpenses.grouped().map({ (expense: SimpleExpense) -> Double in expense.cost })
            }
            
            groupedDataValues = structureValues(labels: groupedDataLabels, values: groupedDataValues)
            groupedPrevDataValues = structureValues(labels: groupedPrevMonthDataLabels, values: groupedPrevMonthDataValues)
            
        } catch let error as NSError {
            print("\(error)")
        }
    }
    
    func predicateGenerator(year: Int, month: Int) -> NSPredicate {
        
        var dateComp = DateComponents()
        dateComp.year = year + 2000
        dateComp.month = month + 1 // In datecomponents, month start from 1
        dateComp.day = 1
        
        let calendar = Calendar.current
        let firstDayOfTheMonth = calendar.date(from: dateComp)
        
        var oneMonth = DateComponents()
        oneMonth.month = 1
        let beginningOfNextMonth = calendar.date(byAdding: oneMonth, to: firstDayOfTheMonth!)
        
        return NSPredicate(format: "%K >= %@ && %K < %@", "date", firstDayOfTheMonth! as NSDate, "date", beginningOfNextMonth! as NSDate)
    }
    
    func structureValues(labels: [String], values: [Double]) -> [Double] {
        K().categories.map({ (category: String) -> Double in
            if labels.firstIndex(of: category) != nil {
                return values[labels.firstIndex(of: category)!]
            }
            return 0
        })
    }
}
