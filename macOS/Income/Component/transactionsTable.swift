//
//  transactionsTable.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 03/08/21.
//

import Foundation
import SwiftUI

struct transactionsTable: View {
    
    @State var date: Date
    @StateObject var transVM = TransactionViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("Transaction List")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .padding()
                Spacer()
                ActionButtonCard(icon: "calendar", title: transVM.formatedMonthYear(), defaultColor: Color("MainColor"), isPressed: $transVM.isOpenCalendar )
                    .onTapGesture {
                        transVM.isOpenCalendar.toggle()
                    }
                    .sheet(isPresented: $transVM.isOpenCalendar) {
                        TransactionByMonthCalendar()
                    }
                    .padding()
            }
            HStack {
                Text("Date")
                    .fontWeight(.semibold)
                    .padding(20)
                    .frame(width: 130, alignment: .leading)
                Text("Product Name")
                    .fontWeight(.semibold)
                    .frame(width: 270, alignment: .leading)
                    .padding(20)
                Text("Quantity")
                    .fontWeight(.semibold)
                    .frame(width: 55, alignment: .leading)
                    .padding(20)
                Text("Price")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Text("Fee")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Text("Net Income")
                    .fontWeight(.semibold)
                    .frame(width: 100, alignment: .leading)
                    .padding(20)
                Spacer()
            }
            if transVM.listTrans.count < 1 {
                HStack {
                    Image("noTransactionIllustration")
                        .resizable()
                        .frame(width: 356, height: 272)
                        .aspectRatio(contentMode: .fill)
                } .padding(.top, 30)
                
                Text("You have no transactions yet.")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentColor2"))
            } else {
                ScrollView {
                    if transVM.listTrans.count > 0 {
                        ForEach(transVM.listTrans) { trans in
                            HStack {
                                Text(trans.td_transaction?.date ?? Date(), style: .date)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 0))
                                    .frame(width: 130, alignment: .leading)
                                Text("\(trans.td_product?.name ?? "") - \(trans.td_product?.color ?? "") - \(trans.td_product?.size ?? "")")
                                    .frame(width: 290, alignment: .leading)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 0))
                                Text("\(trans.quantity)")
                                    .frame(width: 55, alignment: .leading)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                                Text("Rp \(trans.price)")
                                    .frame(width: 100, alignment: .leading)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                                Text("Rp \(Int(transVM.calculatefee(trans)))")
                                    .frame(width: 100, alignment: .leading)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                                Text("Rp \((trans.price-trans.td_product!.costPrice)*trans.quantity-Int64(transVM.calculatefee(trans)))")
                                    .frame(width: 100, alignment: .leading)
                                    .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 0))
                                Spacer()
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(10)
        .onAppear(perform: {
            transVM.fetchData()
        })
    }
}
