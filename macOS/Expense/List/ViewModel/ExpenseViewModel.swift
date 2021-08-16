//
//  ExpenseViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 06/08/21.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []
    @Published var totalExpense: Int = 0
    @Published var groupedExpense: [SimpleExpense] = []
    
    @Published var isOpenCalendar = false
    @Published var yearIndex = Calendar.current.component(.year, from: Date()) - 2000
    @Published var monthIndex = Calendar.current.component(.month, from: Date()) - 1 
    
    @Published var amount: String = "" {
        didSet {
            let filtered = amount.filter { "0123456789".contains($0) }
            if filtered != amount { self.amount = filtered } }
        }
    
    @Published var quantity: String = "0" {
        didSet {
            let filtered = quantity.filter { "0123456789".contains($0) }
            if filtered != quantity { self.quantity = filtered } }
        }
    
    @Published var name: String = ""
    @Published var categoryIndex = 0
    @Published var date = Date()
    @Published var repeatIndex = 0
    
    @Published var isNewData = false
    @Published var updateItem: Expense!
    
    var simpleExpenses: [SimpleExpense] = []
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func formatedMonthYear() -> String {
        let realYear = 2000 + yearIndex
        let realMonth = K().monthName[monthIndex]
        
        return "\(realMonth) \(realYear)"
    }
    
    func writeExpense() {
        
        if updateItem != nil {
            // Update old data ...
            let priceDiff = (Int64(amount) ?? 0) - updateItem.price

            updateItem.date = date
            updateItem.category = K().categories[categoryIndex]
            updateItem.name = name
            updateItem.price = Int64(amount) ?? 0
            updateItem.quantity = Int64(quantity) ?? 0
            updateItem.repeatEvery = K().repeats[repeatIndex]
            
            CoreDataManager.sharedManager.saveContext()
            totalExpense += Int(priceDiff)
            
            // Removing updatingItem if successfull
            updateItem = nil
            isNewData.toggle()
            resetExpenseData()
            
            return
        }
        
        let newExpense = Expense(context: context)
        
        newExpense.date = date
        newExpense.name = name
        newExpense.category = K().categories[categoryIndex]
        newExpense.quantity = Int64(quantity) ?? 0
        newExpense.price = Int64(amount) ?? 0
        newExpense.repeatEvery = K().repeats[repeatIndex]
        
        // Saving data ...
        do {
            CoreDataManager.sharedManager.saveContext()
            expenses.append(newExpense)
            totalExpense += Int(amount) ?? 0
            
            // Closing view when success
            isNewData.toggle()
            resetExpenseData()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editExpense(_ expense: Expense) {
        updateItem = expense
        
        // Togging the newDataView ...
        date = expense.date!
        amount = String(expense.price)
        name = expense.name!
        quantity = String(expense.quantity)
        categoryIndex = K().categories.firstIndex(of: expense.category!) ?? 0
        repeatIndex = K().repeats.firstIndex(of: expense.repeatEvery ?? "Never")!
        isNewData.toggle()
    }
    
    func getAllExpense(sortByQty: Bool = false) {
        
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        let thisMonthPredicate = predicateGenerator(year: yearIndex, month: monthIndex)
        fetchRequest.predicate = thisMonthPredicate
        
        if sortByQty {
            let sortByQty = NSSortDescriptor.init(key: "quantity", ascending: false)
            fetchRequest.sortDescriptors = [sortByQty]
        } else {
            let sortByDate = NSSortDescriptor.init(key: "date", ascending: false)
            fetchRequest.sortDescriptors = [sortByDate]
        }
        
        do {
            expenses = try context.fetch(fetchRequest)
            totalExpense = Int(expenses.reduce(0) { $0 + $1.price })
            
            for expense in expenses {
                let newSimpleExpense = SimpleExpense(name: expense.category ?? "", cost: Double(expense.price))

                simpleExpenses.append(newSimpleExpense)
            }
            
            groupedExpense = simpleExpenses.grouped()
            
        } catch let error as NSError {
            print("\(error)")
        }
    }
    
    func deleteExpense(_ expense: Expense) {
        
        totalExpense -= Int(expense.price)
        CoreDataManager.sharedManager.deleteContext(expense)
        
        if let index = expenses.firstIndex(of: expense) {
            expenses.remove(at: index)
        }
    }
    
    func resetExpenseData() {
        amount = ""
        name = ""
        quantity = ""
        categoryIndex = 0
        repeatIndex = 0
        date = Date()
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
}
