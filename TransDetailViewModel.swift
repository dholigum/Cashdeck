//
//  TransDetailViewModel.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

class TransDetailViewModel: ObservableObject {
    
    static let shared: TransDetailViewModel = TransDetailViewModel()
    
    @Published var listTransTemp: [TransactionDetailTemp] = [TransactionDetailTemp]()
    @StateObject var transVM = TransactionViewModel.shared
    
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
    
    func connectProduct (_ transTemp: TransactionDetailTemp, product: Products) {
        //connecting product to transDetailTemp
        transTemp.tdtemp_product = product
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveToTransaction (_ transTemp: TransactionDetailTemp) {
        if((transTemp.tdtemp_product) != nil) {
            var transList = [Transaction]()
            let newTrans = Transaction(context: self.context)
            let newTransDetail = TransactionDetail(context: self.context)
            let newAlias = Alias(context: self.context)

            //adding data to transDetail table
            newTransDetail.price = transTemp.price
            newTransDetail.quantity = transTemp.quantity
            newTransDetail.td_product = transTemp.tdtemp_product
            
            newAlias.name_alias = transTemp.productName
            newAlias.product_id = transTemp.productSKU
            newAlias.sku_product = transTemp.tdtemp_product

            //checking if orderId exists in core data
            do {
                let request = Transaction.fetchRequest() as NSFetchRequest<Transaction>

                let pred = NSPredicate(format: "orderId = %@", "\(String(describing: transTemp.orderId))")
                request.predicate = pred

                transList = try context.fetch(request)
            } catch {
                print(error.localizedDescription)
            }

            if(transList.isEmpty) {
                //if orderId does not exist in core data
                newTrans.date = transTemp.date
                newTrans.orderId = transTemp.orderId
                newTrans.transaction_channel = transTemp.tdtemp_channel
                newTransDetail.td_transaction = newTrans
            } else {
                //if orderId exists in core data
                newTransDetail.td_transaction = transList.first
            }

            //saving to core data
            do {
                context.delete(transTemp)
                
                try self.context.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
