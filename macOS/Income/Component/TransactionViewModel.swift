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
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        do {
            self.listTrans = ProductSoldModel.shared.getAllDetail()
        }
        catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func addData(td: TransactionDetail) {
        print(listTrans.count)
        listTrans.append(td)
        print(listTrans.count)
    }
}
