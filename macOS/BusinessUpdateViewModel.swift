//
//  BusinessUpdateViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 13/08/21.
//

import Foundation

class BusinessUpdateViewModel {
    static let shared = BusinessUpdateViewModel()
    var yearIndex = Calendar.current.component(.year, from: Date()) - 2000
    var monthIndex = Calendar.current.component(.month, from: Date()) - 1
    let businessUpdateModel = BusinessUpdateModel.shared
    let expenseVM = OverviewExpenseViewModel()
    let businessGrowthModel = BusinessGrowthModel.shared
    
    
    func isGrowth() -> String {
        let currIncome = getNetIncomeTrans(detail: detailThisMonth())
        let prevIncome = getNetIncomeTrans(detail: detailLastMonth())

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
    
    func getNetIncomeTrans(detail: [TransactionDetail]) -> Int64 {
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
        
        let details = businessUpdateModel.getDetail().filter{
            guard let trans = $0.td_transaction, let date = trans.date, let lastMonth = lastMonth else { return false}
            return date >= lastMonth
        }
        return details
    }
    
    func detailLastMonth() -> [TransactionDetail] {
        let prevMonth = Calendar.current.date(byAdding: .month, value: -2, to: Date())
        let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let details = businessUpdateModel.getDetail().filter{ ($0.td_transaction?.date!)! >= prevMonth!  && ($0.td_transaction?.date!)! <= lastMonth!}
        
        return details
    }
    
    func calculateFixIncomePerDay() -> [Double] {
        var listDate = [Int64]()
        var listMonth = [Int64]()
        var fixIncome = [TransModel]()
        for data in businessGrowthModel.getSortedDetail(){
            if let data = data.td_transaction, let date = data.date {
                listDate.append(convertDateToDay(date: date))
                listMonth.append(convertDateToMonth(date: date))
            }
        }
        
        let clearDate = Array(NSOrderedSet(array: listDate))
        for date in clearDate {
            let temp = filteringDetails(details: businessGrowthModel.getSortedDetail(), date: date as! Int64)
            let income = getNetIncomeTrans(detail: temp)
            guard let data = temp[0].td_transaction?.date else { continue }
            fixIncome.append(TransModel(netIncome: income, month: convertDateToMonth(date: data)))
        }
        return calculateTotalIncomePerDay(income: fixIncome)
    }
    
    func getTodaysNetIncome() -> String {
        return String(calculateTodaysNet()).currencyFormatting()
    }
    
    func calculateTodaysNet() -> Double {
        let allNetIncome = calculateFixIncomePerDay()
        let totalNetToday = allNetIncome[allNetIncome.count - 1] - allNetIncome[allNetIncome.count - 2]
        return totalNetToday
    }
    
    func getStatusPercent() -> String {
        let allNetIncome = calculateFixIncomePerDay()
        let percent = (calculateTodaysNet()/allNetIncome[allNetIncome.count - 2]) * 100
        return String(format: "%.2f", percent)
    }
    
    func getStatusName() -> String {
        return calculateTodaysNet() <= 0 ? "Decrease" : "Increase"
    }
    
    func getColor() -> String {
        return calculateTodaysNet() <= 0 ? "colorDown" : "colorUp"
    }
    
    func calculateTotalIncomePerDay(income: [TransModel]) -> [Double] {
        var totalNetIncome = [Double]()
        for data in income {
            let total = data.netIncome - (calculateExpense(date: data.month) / 30)
            totalNetIncome.append(Double(total))
        }
        return totalNetIncome
    }
    
    func convertDateToDay(date: Date) -> Int64 {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: date)
        return Int64(day) ?? 0
    }
    
    func convertDateToMonth(date: Date) -> Int64 {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: date)
        return Int64(month) ?? 0
    }
    
    func filteringDetails(details: [TransactionDetail], date: Int64) -> [TransactionDetail] {
        let data = details.filter { convertDateToDay(date: ($0.td_transaction?.date)!) == date }
        return data
    }
    
    func calculateExpense(date: Int64) -> Int64 {
        let expenses = businessGrowthModel.getExpenses().filter {
            if let data = $0.date {
                return (convertDateToMonth(date: data) == date)
            }
            return false
        }
        return expenses.map({$0.price}).reduce(0, +)
    }
}
