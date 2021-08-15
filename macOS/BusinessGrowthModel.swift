//
//  BusinessGrowthModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 13/08/21.
//

import Foundation
import CoreData

struct TransModel {
    var netIncome: Int64
    var month: Int64
}

class BusinessGrowthModel {
    static let shared = BusinessGrowthModel()
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func getSortedDetail() -> [TransactionDetail] {
        let fetchRequest: NSFetchRequest<TransactionDetail> = TransactionDetail.fetchRequest()
        
        do {
            var details = try context.fetch(fetchRequest)
            details.sort() { ($0.td_transaction?.date!)! < ($1.td_transaction?.date!)! } //Ampoooonnn
            return details
        }
        catch {
            print("\(error.localizedDescription)")
        }
        
        return []
    }
    
    func getExpenses() -> [Expense] {
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        do {
            let expenses = try context.fetch(fetchRequest)
            return expenses
        }
        catch {
            print("\(error.localizedDescription)")
        }
        return []
    }
}
