//
//  modalImportFile.swift
//  Cashdeck (macOS)
//
//  Created by Azrullah Kainage on 04/08/21.
//

import SwiftUI
import CoreXLSX

struct modalImportFile: View {
    @Binding var isVisible: Bool
    @Binding var showmodalSync: Bool
    @StateObject var TransDetailVM = TransDetailViewModel.shared
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {isVisible = false}, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .padding(.init(top: 18, leading: 18, bottom: 18, trailing: 18))
                        .frame(width: 100, alignment: .leading)
                })
                .buttonStyle(PlainButtonStyle())
                Text("New Transaction")
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                    .foregroundColor(Color("AccentColor2"))
                    .frame(width: 192, alignment: .center)
                Text(" ")
                    .frame(width: 100)
            }
            .frame(height: 50)
            .background(Color("AccentColor"))
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
            Button(action: {btnImportPressed()
                TransDetailVM.fetchDataTrans()
            }, label: {
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
        .frame(width: 392, height: 374)
        .background(Color("MainColor"))
    }
}

extension modalImportFile {
    func btnImportPressed () {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["xlsx", "xls"]
        if panel.runModal() == .OK {
            do {

            var tmp = "\(panel.url!)".split(separator: "/")
            tmp.removeFirst()
            let path = tmp.joined(separator: "/")
            let file = XLSXFile(filepath: "/\(path)")

            let sharedString = try file!.parseSharedStrings()
            var i = 0
            for wbk in try file!.parseWorkbooks() {
                for (_, path) in try file!.parseWorksheetPathsAndNames(workbook: wbk) {
                        let worksheet = try file!.parseWorksheet(at: path)
                        for row in worksheet.data?.rows ?? [] {
                            if i > 3 {
                                let isoDate = row.cells[3].stringValue(sharedString!)!
                                let dateFormatter = DateFormatter()
                                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
                                let date = dateFormatter.date(from:isoDate)
                                let productName = row.cells[6].stringValue(sharedString!)!
                                let qyt = Int64(row.cells[7].stringValue(sharedString!)!)
                                let price = Int64(row.cells[10].stringValue(sharedString!)!)
                                let productId = row.cells[5].stringValue(sharedString!)!
                                let SKU = row.cells[8].stringValue(sharedString!)
                                let orderId = row.cells[1].stringValue(sharedString!)
                                let newTrans = transactionModel(date: date!, productName: productName, qyt: qyt!, price: price!, SKU: SKU ?? productId, orderId: orderId!)
                                TransDetailVM.addTransTemp(newTrans)
                            }
                            i += 1
                        }
                    }
                }
                try context.save()
                isVisible = false
                showmodalSync = true
            } catch {
              print(error)
            }
        }
    }
}
