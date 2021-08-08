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
    
    @Published var expenseTips: [String] = ["Try omnichannel. Customers are not fixed in one online marketplace", "", "", "", ""]
    
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
            
            // Expense Tips
            print(expenseTips)
            getHighestMonthlyExpense()
            getPersonalExpensePercentage()
            getComparisonWithPreviousMonth()
            
        } catch let error as NSError {
            print("\(error)")
        }
    }
    
    func getHighestMonthlyExpense() {
        
        let highestExpenseValue = groupedDataValues.max()!
        let highestExpenseLabel = K().categories[groupedDataValues.firstIndex(of: highestExpenseValue)!]
        var tips: String = ""
        if highestExpenseValue > 300000 {
            tips = "Based on chart, you have the largest expense in \(highestExpenseLabel) at \(String(highestExpenseValue).currencyFormatting()).  If possible, reduce \(highestExpenseLabel) bill to balance your expense"
        } else { tips = "" }
        expenseTips[1] = tips
    }
    
    func getPersonalExpensePercentage() {
        
        let personalExpenseValue = groupedDataValues[K().categories.firstIndex(of: "Personal")!]
        let totalExpenseDataValue = groupedDataValues.reduce(0, +)
        let personalExpensePercentage = personalExpenseValue/totalExpenseDataValue * 100
        var tips: String = ""
        if personalExpensePercentage > 15 {
            tips = "Based on chart, you have \(String(format: "%.2f", personalExpensePercentage))% for personal expense. You might consider to reduce your personal expense."
        } else if personalExpensePercentage.isNaN  {
            tips = ""
        } else {
            tips = "Based on chart, you have \(String(format: "%.2f", personalExpensePercentage))% for personal expense. Keep that number under 15% to reduce your overall expense"
        }
        expenseTips[2] = tips
    }
    
    func getComparisonWithPreviousMonth() {
        
        let totalThisMonthExpenses = groupedDataValues.reduce(0, +)
        let totalPrevMonthExpenses = groupedPrevDataValues.reduce(0, +)
        let monthDifference = abs(totalThisMonthExpenses - totalPrevMonthExpenses)
        var tips: String = ""
        if monthDifference > 150000 {
            tips = "Based on your previous expense at \(String(totalPrevMonthExpenses).currencyFormatting()) and this month expense at \(String(totalThisMonthExpenses).currencyFormatting()), Your expenses are not stable. Try to inspect your expenses again and get rid of unuseful expenses"
        } else {
            tips = "Based on your previous expense at \(String(totalPrevMonthExpenses).currencyFormatting()) and this month expense at \(String(totalThisMonthExpenses).currencyFormatting()), Your expenses are stable. Keep it up!"
        }
        expenseTips[3] = tips
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
