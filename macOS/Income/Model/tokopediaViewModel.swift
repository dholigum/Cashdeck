//
//  tokopediaViewModel.swift
//  Cashdeck
//
//  Created by Jonathan Clive on 13/08/21.
//

import Foundation

import SwiftUI

class tokopediaViewModel: ObservableObject {
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func totalNetIncome() -> Int64 {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        var totalNetIncome:Int64 = 0
        
        for trans in transDetailList {
            totalNetIncome += (trans.price - trans.td_product!.costPrice)*trans.quantity
        }
        
        return totalNetIncome
    }
    
    func totalProductSold() -> Int {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        var totalProductSold:Int = 0
        
        for trans in transDetailList {
            totalProductSold += Int(trans.quantity)
        }
        
        return totalProductSold
    }
    
    func totalOrder() -> Int {
        var transList: [Transaction] = [Transaction]()
        do {
            transList = try context.fetch(Transaction.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        return transList.count
    }
}
