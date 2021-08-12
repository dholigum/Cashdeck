//
//  ModalAddProduct.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 06/08/21.
//

import SwiftUI
import CoreXLSX

struct ModalAddProduct: View {
    @Binding var isVisible: Bool
    @ObservedObject var ProductVM = ProductViewModel()
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
            Button(action: {btnImportPressed()}, label: {
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
    func btnImportPressed () {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["xlsx", "xls", "number"]
        if panel.runModal() == .OK {
            do {

            var tmp = "\(panel.url!)".split(separator: "/")
            tmp.removeFirst()
            let fileName = tmp[tmp.count - 1]
            let addSpace = fileName.replacingOccurrences(of: "%20", with: " ")
            tmp[tmp.count - 1] = "\(addSpace)"
            let path = tmp.joined(separator: "/")
            let file = XLSXFile(filepath: "/\(path)")
            let sharedString = try file?.parseSharedStrings()
                
            var i = 0
            for wbk in try file!.parseWorkbooks() {
                for (_, path) in try file!.parseWorksheetPathsAndNames(workbook: wbk) {
                        let worksheet = try file!.parseWorksheet(at: path)
                        for row in worksheet.data?.rows ?? [] {
                            if i > 0 {
                                let name = row.cells[1].stringValue(sharedString!)!
                                let size = row.cells[3].stringValue(sharedString!)!
                                let color = row.cells[4].stringValue(sharedString!)!
                                let costPrice = Int64(row.cells[2].stringValue(sharedString!)!)
                                let SKU = row.cells[0].stringValue(sharedString!)!
                                self.ProductVM.addProduct(ProductModel(SKU: SKU, name: name, costPrice: costPrice!, size: size, color: color))
                            }
                            i += 1
                        }
                    }
                }
                ProductVM.fetchProducts()
                isVisible = false
            } catch {
              print(error)
            }
        }
    }
}
