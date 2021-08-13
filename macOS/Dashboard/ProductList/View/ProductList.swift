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
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Product List")
                    .font(Font.custom("SFProDisplay-Bold", size: 24))
                    .padding(.init(top: 19, leading: 10, bottom: 10, trailing: 0))
                    .foregroundColor(Color("AccentColor2"))
            }
            HStack {
                CardSummary(title: "Total Product", value: "20")
                CardSummary(title: "Total Quantity", value: "70")
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
            } .padding(.top, 10)
            
            ProductTable()
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(minWidth: window!.width / 1.8)
    }
}

struct ProductList_Preview: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
