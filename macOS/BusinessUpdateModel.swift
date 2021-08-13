//
//  BusinessUpdateModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 13/08/21.
//

import Foundation
import CoreData

class BusinessUpdateModel {
    
    static let shared = BusinessUpdateModel()
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func getExpense(monthPredicate: NSPredicate) -> [Expense] {
        let fetchRequestMonth: NSFetchRequest<Expense> = Expense.fetchRequest()
        fetchRequestMonth.predicate = monthPredicate
        
        do {
            let expenses = try context.fetch(fetchRequestMonth)
            return expenses
        }catch {
            print("\(error.localizedDescription)")
        }
        
        return []
    }
    
    func getDetail() -> [TransactionDetail] {
        let fetchDetail: NSFetchRequest<TransactionDetail> = TransactionDetail.fetchRequest()
        
        
        do {
            let details = try context.fetch(fetchDetail)
            return details
            
        } catch {
        print("\(error.localizedDescription)")
    }
        return []
    }
}
