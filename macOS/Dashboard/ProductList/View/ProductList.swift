//
//  Tokopedia.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI
import CoreXLSX

struct ProductList: View {
    @State var showModal = false
    @State var listTrans = [transactionModel]()
    @ObservedObject var listTransTemp = TransDetailViewModel()
    
    init() {
        listTransTemp.fetchDataTrans()
//        print(listTransTemp.listTransTemp)
    }
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        VStack {
            HStack {
                Text("Product List")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.init(top: 19, leading: 10, bottom: 20, trailing: 0))
                    .foregroundColor(Color("AccentColor2"))
                Spacer()
            }
            HStack {
                CardSummary(title: "Total Product", value: "20")
                CardSummary(title: "Total Quantity", value: "70")
                Spacer()
            }
            HStack {
                primaryBtn(imageName: "square.and.arrow.down", title: "Import Product", width: 170)
                    .onTapGesture {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal, content: {
                        ModalAddProduct(isVisible: $showModal)
                    })
                Spacer()
            } .padding(.top, 30)
            HStack {
                
            }
            .padding(.top, 20)
            Spacer()
        }
        .frame(minWidth: window!.width / 1.8)
    }
}

struct ProductList_Preview: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
