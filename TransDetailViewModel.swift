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
    
    init() {
        fetchDataTrans()
    }
    
    func fetchDataTrans () {
        do {
            self.listTransTemp = try context.fetch(TransactionDetailTemp.fetchRequest())
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getChannel() -> Channel {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Channel")
        do {
            let item = try context.fetch(fetchRequest)
            let data = item as! [Channel]
            return data[0]
        }catch {
            print(error)
        }
        return Channel()
    }
    
    func addTransTemp (_ transTemp: transactionModel) {
        //get channel
        let channel = getChannel()
        var isFound = false
        var productCheck: Products = Products()
        let fetchReq1 = NSFetchRequest<NSManagedObject>(entityName: "Products")
        fetchReq1.predicate = NSPredicate(format: "name == %@", transTemp.productName)
        let fetchReq2 = NSFetchRequest<NSManagedObject>(entityName: "Alias")
        fetchReq2.predicate = NSPredicate(format: "name_alias == %@", transTemp.productName)
        do {
            let result1 = try context.fetch(fetchReq1)
            if (result1.count > 0){
                productCheck = result1.first as! Products
                isFound = true
            } else {
                let result2 = try context.fetch(fetchReq2)
                if (result2.count > 0) {
                    let aliasCheck = result2.first as! Alias
                    productCheck = aliasCheck.sku_product!
                    isFound = true
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        if (isFound == false){
            let newTmpTrans = TransactionDetailTemp(context: self.context)
            newTmpTrans.orderId = transTemp.orderId
            newTmpTrans.date = transTemp.date
            newTmpTrans.productName = transTemp.productName
            newTmpTrans.productSKU = transTemp.SKU
            newTmpTrans.quantity = transTemp.qyt
            newTmpTrans.price = transTemp.price
            newTmpTrans.tdtemp_channel = channel
        } else {
            isFound = false
            //adding new transaction detail
            let newTransDetail = TransactionDetail(context: self.context)
            newTransDetail.price = transTemp.price
            newTransDetail.quantity = transTemp.qyt
            newTransDetail.td_product = productCheck
            //checking if orderId exists
            var transCheck: Transaction = Transaction()
            let fetchTransCheck = NSFetchRequest<NSManagedObject>(entityName: "Transaction")
            fetchTransCheck.predicate = NSPredicate(format: "orderId = %@", transTemp.orderId)
            do {
                let resultTrans = try context.fetch(fetchTransCheck)
                if (resultTrans.count > 0){
                    transCheck = resultTrans.first as! Transaction
                    isFound = true
                }
            } catch {
                print(error.localizedDescription)
            }
            //if orderId does not exists
            if (isFound == false) {
                let newTrans = Transaction(context: self.context)
                newTrans.date = transTemp.date
                newTrans.orderId = transTemp.orderId
                newTrans.transaction_channel = channel
                newTransDetail.td_transaction = newTrans
            } else {
                newTransDetail.td_transaction = transCheck
            }
        }
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
                fetchDataTrans()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
