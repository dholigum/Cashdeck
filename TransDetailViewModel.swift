//
//  TransDetailViewModel.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

class TransDetailViewModel: ObservableObject {
    
    @Published var listTransTemp: [TransactionDetailTemp] = [TransactionDetailTemp]()
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func fetchDataTrans () {
        do {
            self.listTransTemp = try context.fetch(TransactionDetailTemp.fetchRequest())
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    func addTransTemp (_ transTemp: transactionModel) {
        let newTmpTrans = TransactionDetailTemp(context: self.context)
        newTmpTrans.price = transTemp.price
        newTmpTrans.productName = transTemp.productName
        newTmpTrans.quantity = transTemp.qyt
        newTmpTrans.productSKU = transTemp.SKU
        do {
            try self.context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
