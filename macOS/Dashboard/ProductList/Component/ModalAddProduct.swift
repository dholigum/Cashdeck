//
//  ModalAddProduct.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 06/08/21.
//

import SwiftUI
import CodableCSV

struct ModalAddProduct: View {
    
    @Binding var isVisible: Bool
    @StateObject var ProductVM = ProductViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {isVisible = false}, label: {
                    Text("Cancel")
                        .font(.system(size: 17))
                        .padding(.init(top: 18, leading: 18, bottom: 18, trailing: 18))
                        .frame(width: 100, alignment: .leading)
                })
                .buttonStyle(PlainButtonStyle())
                Text("New Product")
                    .font(.system(size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .frame(width: 192, alignment: .center)
                Text(" ")
                    .frame(width: 100)
            }
            .background(Color("AccentColor"))
            HStack {
                primaryBtn(imageName: "square.and.arrow.down", title: "Download Template", width: 359)
                    .onTapGesture {
                        downloadTemplate()
                    }
            }
            VStack {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.black.opacity(0.1))
                    .padding(10)
                Text("Upload excel file")
                    .font(.system(size: 18))
                    .padding(10)
                Text("Allowed file extensions .xlsm .xlsx")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.2))
            }
            .frame(width: 359, height: 180, alignment: .center)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.init(top: 25, leading: 0, bottom: 30, trailing: 0))
            Button(action: {importCSVPressed()}, label: {
                Text("Import")
                    .font(.system(size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    
                    .frame(width: 359, height: 49)
                    .background(Color("AccentColor"))
                    .cornerRadius(15)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 27)
            Spacer()
        }
        .frame(width: 392, height: 447)
        .background(Color("MainColor"))
    }
}

extension ModalAddProduct {
    func importCSVPressed () {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["csv"]
        if panel.runModal() == .OK {
            do {
                let reader = try CSVReader(input: URL(resolvingAliasFileAt: panel.url!)) { $0.headerStrategy = .firstLine }
                for row in reader {
                    let sku = row[0]
                    let name = row[1]
                    let color = row[2]
                    let size = row[3]
                    let quantity = Int64(row[4])
                    let costPrice = Int64(row[5])
                    
                    self.ProductVM.addProduct(ProductModel(SKU: sku, name: name, costPrice: costPrice!, size: size, color: color, quantity: quantity!))
                }
                ProductVM.fetchProducts()
                isVisible = false
            } catch {
                print(error)
            }
        }
    }
}
