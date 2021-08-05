//
//  SyncDataModal.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 04/08/21.
//

import SwiftUI

struct SyncDataModal: View {
    @Binding var listTransTemp: [TransactionDetailTemp]
    @Binding var showModalSync: Bool
    @Binding var showModal: Bool
    @ObservedObject var ProductViewModel = ProductviewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {showModalSync = false; showModal = false}, label: {
                    Text("Cancel")
                        .font(.system(size: 17))
                        .padding(.init(top: 18, leading: 18, bottom: 18, trailing: 18))
                        .frame(width: 100, alignment: .trailing)
                })
                .buttonStyle(PlainButtonStyle())
                Text("Sync Data")
                    .font(.system(size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .frame(width: 661, alignment: .center)
                Button(action: {}, label: {
                    Text("Sync")
                        .font(.system(size: 17))
                        .padding(.init(top: 18, leading: 18, bottom: 18, trailing: 18))
                        .frame(width: 100, alignment: .trailing)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .background(Color("AccentColor"))
            VStack {
                HStack {
                    Text("Status")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 80)
                    Text("Product Name (Marketplace)")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 380, alignment: .leading)
                    Text("Product Name (Cashdeck)")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 340, alignment: .leading)
                    Spacer()
                }
                .padding(35)
                if listTransTemp.count > 0 {
                    ForEach(listTransTemp) { trans in
                        HStack {
                            if ProductViewModel.listProducts.count > 0 {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                        .foregroundColor(Color.green)
                                }
                                .frame(width: 80)
                            } else {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                        .foregroundColor(Color.orange)
                                }
                                .frame(width: 80)
                            }
                            Text(trans.productName!)
                                .font(.system(size: 16))
                                .frame(width: 380, alignment: .leading)
                            if ProductViewModel.listProducts.count > 0 {
                                Text(trans.productName!)
                                    .font(.system(size: 16))
                                    .frame(width: 340, alignment: .leading)
                                Spacer()
                            } else {
                                Text("-- Choose Products --")
                                    .font(.system(size: 16))
                                    .frame(width: 340, alignment: .leading)
                                Spacer()
                            }
                        }
                        Divider()
                            .padding(10)
                    }
                }
            }
            .frame(width: 800)
            .background(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .background(Color("MainColor"))
        .onAppear(perform: fetchData)
    }
}

extension SyncDataModal {
    func fetchData () {
        ProductViewModel.fetchProducts()
    }
}
