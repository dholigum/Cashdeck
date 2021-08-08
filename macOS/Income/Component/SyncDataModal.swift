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
    @ObservedObject var TransDetailVM = TransDetailViewModel()
    
    @State var chooseProduct = false
    @State var transPicked: TransactionDetailTemp
    
//    var transs: TransactionDetailTemp
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {showModalSync = false; showModal = false}, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Sync Data")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                
                Spacer()
                
                Button(action: {
                    for transTemp in listTransTemp {
                        TransDetailVM.saveToTransaction(transTemp)
                    }
                    showModalSync = false
                    showModal = false
                }, label: {
                    Text("Sync")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
            .frame(height: 50)
            .background(Color("AccentColor"))
            .background(Color("AccentColor"))
            VStack {
                HStack {
                    Text("Status")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 80)
                        .padding(.leading, 30)
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
                .padding(.horizontal, 35)
                .padding(.top, 20)
                .padding(.bottom, 10)
                Divider()
                if listTransTemp.count > 0 {
                    ScrollView (showsIndicators: true) {
                        ForEach(listTransTemp) { trans in
                            if trans.productName != nil {
                                HStack {
                                    HStack {
                                        if trans.tdtemp_product != nil{
                                            Image(systemName: "checkmark.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 24)
                                                .foregroundColor(Color.green)
                                        } else {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 24)
                                                .foregroundColor(Color.yellow)
                                        }
                                    }
                                        .frame(width: 80)
                                    
                                    Text(trans.productName ?? "")
                                        .font(.system(size: 16))
                                        .frame(width: 380, alignment: .leading)
                                    Button(action: {
                                        chooseProduct = true
                                        print(trans.productName)
                                        transPicked = trans
                                    }, label: {
                                        if trans.tdtemp_product != nil {
                                        Text("\(trans.tdtemp_product?.name ?? "") - \(trans.tdtemp_product?.color ?? "") - \(trans.tdtemp_product?.size ?? "")")
                                        } else {
                                            Text("-- Choose Products --")
                                        }
                                        Spacer()
                                        Text(">")
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                    .font(.system(size: 16))
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        .sheet(isPresented: $chooseProduct, content: {
                            ChooseProductModal(chooseProductt: $chooseProduct, transDetaill: transPicked)
                        })
                    }
                    .frame(height: 456)
                }
            }
            .frame(width: 800)
            .background(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .background(Color("MainColor"))
    }
}
