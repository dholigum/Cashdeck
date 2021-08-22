//
//  tokopediaViewModel.swift
//  Cashdeck
//
//  Created by Jonathan Clive on 13/08/21.
//

import Foundation

import SwiftUI

class IncomeViewModel {
    
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
    
    func totalNetIncome(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int64 {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transDetailList.filter() {
            $0.td_transaction?.date?.year == (yearIndex) && $0.td_transaction?.date?.month == (monthIndex) && $0.td_transaction?.transaction_channel?.name == channel
        }
        
        var totalNetIncome:Int64 = 0
        
        for trans in transListFilterd {
            totalNetIncome += (trans.price - trans.td_product!.costPrice)*trans.quantity-Int64(calculatefee(trans))
        }
        
        return totalNetIncome
    }
    
    func increaseNetIncome(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int {
        var netIncome1: Int64
        var netIncome2: Int64
        if monthIndex == 1 {
            netIncome1 = totalNetIncome(12, yearIndex: yearIndex-1, channel: channel)
            netIncome2 = totalNetIncome(monthIndex, yearIndex: yearIndex, channel: channel)
        } else {
            netIncome1 = totalNetIncome(monthIndex-1, yearIndex: yearIndex, channel: channel)
            netIncome2 = totalNetIncome(monthIndex, yearIndex: yearIndex, channel: channel)
        }
        if netIncome1 == 0{
            return 100
        } else if netIncome2 == 0 {
            return 0
        } else {
            return Int(Double(netIncome2-netIncome1)/Double(netIncome1)*100)
        }
    }
    
    func totalProductSold(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int {
        var transDetailList: [TransactionDetail] = [TransactionDetail]()
        do {
            transDetailList = try context.fetch(TransactionDetail.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transDetailList.filter() {
            $0.td_transaction?.date?.year == (yearIndex) && $0.td_transaction?.date?.month == (monthIndex) && $0.td_transaction?.transaction_channel?.name == channel
        }
        
        var totalProductSold:Int = 0
        
        for trans in transListFilterd {
            totalProductSold += Int(trans.quantity)
        }
        
        return totalProductSold
    }
    
    func increaseProductSold(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int {
        var prodSold1: Int
        var prodSold2: Int
        if monthIndex == 1 {
            prodSold1 = totalProductSold(12, yearIndex: yearIndex-1, channel: channel)
            prodSold2 = totalProductSold(monthIndex, yearIndex: yearIndex, channel: channel)
        } else {
            prodSold1 = totalProductSold(monthIndex-1, yearIndex: yearIndex, channel: channel)
            prodSold2 = totalProductSold(monthIndex, yearIndex: yearIndex, channel: channel)
        }
        if prodSold1 == 0{
            return 100
        } else if prodSold2 == 0 {
            return 0
        } else {
            return Int(Double(prodSold2-prodSold1)/Double(prodSold1)*100)
        }
    }
    
    func totalOrder(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int {
        var transList: [Transaction] = [Transaction]()
        do {
            transList = try context.fetch(Transaction.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        
        let transListFilterd = transList.filter() {
            $0.date?.year == (yearIndex) && $0.date?.month == (monthIndex) && $0.transaction_channel?.name == channel
        }
        
        return transListFilterd.count
    }
    
    func increaseTotalOrder(_ monthIndex: Int, yearIndex: Int, channel: String) -> Int {
        var totalOrd1: Int
        var totalOrd2: Int
        if monthIndex == 1 {
            totalOrd1 = totalProductSold(12, yearIndex: yearIndex-1, channel: channel)
            totalOrd2 = totalProductSold(monthIndex, yearIndex: yearIndex, channel: channel)
        } else {
            totalOrd1 = totalProductSold(monthIndex-1, yearIndex: yearIndex, channel: channel)
            totalOrd2 = totalProductSold(monthIndex, yearIndex: yearIndex, channel: channel)
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
