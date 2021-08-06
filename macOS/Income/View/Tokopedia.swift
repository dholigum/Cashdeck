//
//  Tokopedia.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI
import CoreXLSX

struct Tokopedia: View {
    @State var showModal = false
    @State var showModalSync = false
    @State var listTrans = [transactionModel]()
    @ObservedObject var listTransTemp = TransDetailViewModel()
    
    init() {
        listTransTemp.fetchDataTrans()
    }
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        VStack {
            HStack {
                Text("Tokopedia")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.init(top: 19, leading: 10, bottom: 20, trailing: 0))
                    .foregroundColor(Color("AccentColor2"))
                Spacer()
            }
            HStack {
                CardReports(title: "Net Income", value: "Rp 988.000", percent: 10, width: 306)
                    .padding(.leading, 10)
                CardReports(title: "Product Sold", value: "10", percent: -10, width: 227)
                    .padding(.leading, 10)
                CardReports(title: "Total Orders", value: "10", percent: 10, width: 227)
                    .padding(.leading, 10)
                Spacer()
            }
            HStack {
                primaryBtn(imageName: "dollarsign.circle.fill", title: "Add Fee", width: 120)
                primaryBtn(imageName: "square.and.arrow.down", title: "Import Data", width: 147)
                    .onTapGesture {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal, content: {
                        modalImportFile(isVisible: $showModal, showmodalSync: $showModalSync)
                    })
                if listTransTemp.listTransTemp.count > 0 {
                    primaryBtn(imageName: "arrow.triangle.2.circlepath.circle", title: "Sync Data", width: 147)
                        .onTapGesture {
                            showModalSync.toggle()
                        }
                        .sheet(isPresented: $showModalSync, content: {
                            SyncDataModal(showModalSync: $showModalSync, showModal: $showModal)
                        })
                }
                Spacer()
            } .padding(.top, 30)
            HStack {
                transactionsTable(date: Date(), listTrans: $listTrans)
            }
            .padding(.top, 20)
            Spacer()
        }
        .frame(minWidth: window!.width / 1.8)
    }
}

struct Tokopedia_Previews: PreviewProvider {
    static var previews: some View {
        Tokopedia()
    }
}
