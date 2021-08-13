//
//  BusinessUpdateViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 13/08/21.
//

import Foundation

class BusinessUpdateViewModel {
    var yearIndex = Calendar.current.component(.year, from: Date()) - 2000
    var monthIndex = Calendar.current.component(.month, from: Date()) - 1
    let businessUpdateModel = BusinessUpdateModel()
    let expenseVM = OverviewExpenseViewModel()
    
    
    func isGrowth() -> String {
        let currIncome = getNetIncome(detail: detailThisMonth())
        let prevIncome = getNetIncome(detail: detailLastMonth())

        let thisMonthPredicate = expenseVM.predicateGenerator(year: yearIndex, month: monthIndex)
        let prevMonthPredicate = expenseVM.predicateGenerator(year: yearIndex, month: monthIndex - 1 )

        let thisMonth = businessUpdateModel.getExpense(monthPredicate: thisMonthPredicate)
        let prevMonth = businessUpdateModel.getExpense(monthPredicate: prevMonthPredicate)
        
        let expenseThisMonth = thisMonth.map({$0.price}).reduce(0, +)
        let expensePrevMonth = prevMonth.map({$0.price}).reduce(0, +)
        if (currIncome - expenseThisMonth) > (prevIncome - expensePrevMonth) {
            return "Your net income this month looks good. Keep it up to maintain your profit stability!"
        }
        return "Your net income this month not looks good. Watch your business"
    }
    
    func mostSellingProduct() -> String {
        return ProductSoldViewModel.init().productSold[0].sku
    }
    
    func getNetIncome(detail: [TransactionDetail]) -> Int64 {
        var total: Int64 = 0
        for data in detail {
            if let prod = data.td_product {
                total += (data.price - prod.costPrice) * data.quantity
            }
        }
        return total
    }
    
    func detailThisMonth() -> [TransactionDetail] {
        let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let details = businessUpdateModel.getDetail().filter{ ($0.td_transaction?.date!)! >= lastMonth! }
        return details
    }
    
    func detailLastMonth() -> [TransactionDetail] {
        let prevMonth = Calendar.current.date(byAdding: .month, value: -2, to: Date())
        let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let details = businessUpdateModel.getDetail().filter{ ($0.td_transaction?.date!)! >= prevMonth!  && ($0.td_transaction?.date!)! <= lastMonth!}
        
        return details
    }
}
