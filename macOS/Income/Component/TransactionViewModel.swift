//
//  TransactionViewModel.swift
//  Cashdeck
//
//  Created by Revarino Putra on 09/08/21.
//

import Foundation

class TransactionViewModel: ObservableObject {
    
    static let shared: TransactionViewModel = TransactionViewModel()
    @Published var listTrans: [TransactionDetail] = [TransactionDetail]()
    
    @Published var isOpenCalendar: Bool = false
    @Published var yearIndex = Calendar.current.component(.year, from: Date()) - 2000
    @Published var monthIndex = Calendar.current.component(.month, from: Date()) - 1 
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        do {
            
            var filteredListTrans = ProductSoldModel.shared.getAllDetail().filter() { $0.td_transaction?.date?.year == (yearIndex + 2000) && $0.td_transaction?.date?.month == (monthIndex + 1)}
            let sortedListTrans = filteredListTrans.sorted(by: {
                $0.td_transaction?.date?.compare(($1.td_transaction?.date)!) == .orderedDescending })
            self.listTrans = sortedListTrans
            
        }
        catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func addData(td: TransactionDetail) {
        listTrans.append(td)
    }
    
    func formatedMonthYear() -> String {
        let realYear = 2000 + yearIndex
        let realMonth = K().monthName[monthIndex]
        
        return "\(realMonth) \(realYear)"
    }
}
