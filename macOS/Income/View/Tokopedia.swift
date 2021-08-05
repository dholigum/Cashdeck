//
//  Tokopedia.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI
import CoreXLSX

struct Tokopedia: View {
    @State var listTrans = [transactionModel]()
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
                        
                    }
//                    .onTapGesture {
//                        let panel = NSOpenPanel()
//                        panel.allowsMultipleSelection = false
//                        panel.allowedFileTypes = ["xlsx", "xls"]
//                        if panel.runModal() == .OK {
//                            do {
//
//                            var tmp = "\(panel.url!)".split(separator: "/")
//                            tmp.removeFirst()
//                            let path = tmp.joined(separator: "/")
//                            let file = XLSXFile(filepath: "/\(path)")
//
//                            let sharedString = try file!.parseSharedStrings()
//                            var i = 0
//                            for wbk in try file!.parseWorkbooks() {
//                                for (_, path) in try file!.parseWorksheetPathsAndNames(workbook: wbk) {
//                                        let worksheet = try file!.parseWorksheet(at: path)
//                                        for row in worksheet.data?.rows ?? [] {
//                                            if i > 3 {
//                                                let isoDate = row.cells[3].stringValue(sharedString!)!
//                                                let dateFormatter = DateFormatter()
//                                                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//                                                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
//                                                let date = dateFormatter.date(from:isoDate)
//                                                let productName = row.cells[6].stringValue(sharedString!)!
//                                                let qyt = Int(row.cells[7].stringValue(sharedString!)!)
//                                                let price = Int(row.cells[10].stringValue(sharedString!)!)
//
//                                                let newTrans = transactionModel(date: date!, productName: productName, qyt: qyt!, price: price!)
//                                                self.listTrans.append(newTrans)
//                                            }
//                                            i += 1
//                                        }
//                                    }
//                                }
//                            } catch {
//                              print(error)
//                            }
//                        }
//                    }
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
