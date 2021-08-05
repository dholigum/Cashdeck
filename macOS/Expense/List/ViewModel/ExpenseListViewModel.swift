//
//  ExpenseListViewModel.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 04/08/21.
//

import SwiftUI

class ExpenseListViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func addExpense(_ expense: ExpenseModel) {
        
        let newExpense = Expense(context: context)
        
        newExpense.date = expense.date
        newExpense.name = expense.name
        newExpense.expense_category = expense.category
        newExpense.quantity = Int64(expense.quantity)
        newExpense.price = Int64(expense.cost)
        newExpense.repeatEvery = expense.repeatEvery
        CoreDataManager.sharedManager.saveContext()
        
        expenses.append(newExpense)
    }
    
    func addExpenseCategory(_ name: String) {
        
        let newCategory = Category(context: context)
        
        newCategory.name = name
        CoreDataManager.sharedManager.saveContext()
    }
    
    func getExpenseCategory(_ name: String) -> Category {
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let data = try context.fetch(fetchRequest) as! [Category]
            return data[0]
        }catch {
            print(error)
        }
        return Category()
    }
    
    func getAllExpense() {
        
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        do {
            expenses = try context.fetch(fetchRequest) as! [Expense]
            
        } catch let error as NSError {
            print("\(error)")
        }
    }
}
