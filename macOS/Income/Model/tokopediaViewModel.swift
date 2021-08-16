//
//  tokopediaViewModel.swift
//  Cashdeck
//
//  Created by Jonathan Clive on 13/08/21.
//

import Foundation

import SwiftUI

class tokopediaViewModel {
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func calculatefee(_ td: TransactionDetail) -> Double{
        let productFee = Double(td.price*td.quantity)*(td.td_transaction?.transaction_channel!.productFee)!/100
        let shippingFee = Double(td.price*td.quantity)*(td.td_transaction?.transaction_channel!.shippingFee)!/100
        if (shippingFee > Double((td.td_transaction?.transaction_channel!.maxShippingFee)!)) {
            return productFee+Double((td.td_transaction?.transaction_channel!.maxShippingFee)!)
        } else {
            return productFee+shippingFee
        }
    }
    
    func totalNetIncome(_ monthIndex: Int, yearIndex: Int) -> Int64 {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transDetailList.filter() {
            $0.td_transaction?.date?.year == (yearIndex) && $0.td_transaction?.date?.month == (monthIndex)
        }
        
        var totalNetIncome:Int64 = 0
        
        for trans in transListFilterd {
            totalNetIncome += (trans.price - trans.td_product!.costPrice)*trans.quantity-Int64(calculatefee(trans))
        }
        
        return totalNetIncome
    }
    
    func increaseNetIncome(_ monthIndex: Int, yearIndex: Int) -> Int {
        var netIncome1: Int64
        var netIncome2: Int64
        if monthIndex == 1 {
            netIncome1 = totalNetIncome(12, yearIndex: yearIndex-1)
            netIncome2 = totalNetIncome(monthIndex, yearIndex: yearIndex)
        } else {
            netIncome1 = totalNetIncome(monthIndex-1, yearIndex: yearIndex)
            netIncome2 = totalNetIncome(monthIndex, yearIndex: yearIndex)
        }
        if netIncome1 == 0{
            return 100
        } else if netIncome2 == 0 {
            return 0
        } else {
            return Int(Double(netIncome2-netIncome1)/Double(netIncome1)*100)
        }
    }
    
    func totalProductSold(_ monthIndex: Int, yearIndex: Int) -> Int {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transDetailList.filter() {
            $0.td_transaction?.date?.year == (yearIndex) && $0.td_transaction?.date?.month == (monthIndex)
        }
        
        var totalProductSold:Int = 0
        
        for trans in transListFilterd {
            totalProductSold += Int(trans.quantity)
        }
        
        return totalProductSold
    }
    
    func increaseProductSold(_ monthIndex: Int, yearIndex: Int) -> Int {
        var prodSold1: Int
        var prodSold2: Int
        if monthIndex == 1 {
            prodSold1 = totalProductSold(12, yearIndex: yearIndex-1)
            prodSold2 = totalProductSold(monthIndex, yearIndex: yearIndex)
        } else {
            prodSold1 = totalProductSold(monthIndex-1, yearIndex: yearIndex)
            prodSold2 = totalProductSold(monthIndex, yearIndex: yearIndex)
        }
        if prodSold1 == 0{
            return 100
        } else if prodSold2 == 0 {
            return 0
        } else {
            return Int(Double(prodSold2-prodSold1)/Double(prodSold1)*100)
        }
    }
    
    func totalOrder(_ monthIndex: Int, yearIndex: Int) -> Int {
        var transList: [Transaction] = [Transaction]()
        do {
            transList = try context.fetch(Transaction.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transList.filter() {
            $0.date?.year == (yearIndex) && $0.date?.month == (monthIndex)
        }
        
        return transListFilterd.count
    }
    
    func increaseTotalOrder(_ monthIndex: Int, yearIndex: Int) -> Int {
        var totalOrd1: Int
        var totalOrd2: Int
        if monthIndex == 1 {
            totalOrd1 = totalProductSold(12, yearIndex: yearIndex-1)
            totalOrd2 = totalProductSold(monthIndex, yearIndex: yearIndex)
        } else {
            totalOrd1 = totalProductSold(monthIndex-1, yearIndex: yearIndex)
            totalOrd2 = totalProductSold(monthIndex, yearIndex: yearIndex)
        }
        if totalOrd1 == 0{
            return 100
        } else if totalOrd2 == 0 {
            return 0
        } else {
            return Int(Double(totalOrd2-totalOrd1)/Double(totalOrd1)*100)
        }
    }
}
