//
//  ContentView.swift
//  Shared
//
//  Created by Syahrul Apple Developer BINUS on 21/07/21.
//

import SwiftUI
import CoreXLSX


struct Transaction: Hashable {
    var date: String
    var productName: String
    var quantity: String
    var price: String
    var netIncome: Int
    
    init(date: String, productName: String, quantity: String, price: String, netIncome: Int) {
        self.date = date
        self.productName = productName
        self.quantity = quantity
        self.price = price
        self.netIncome = netIncome
    }
}


class ContenViewOpenPanel: NSObject, NSOpenSavePanelDelegate {
    //    func panel(_ sender: Any, shouldEnable url: URL) -> Bool {
    //        print(url.absoluteString)
    //        return true
    //    }
    func panel(_ sender: Any, didChangeToDirectoryURL url: URL?) {
        print(url, "did change to url")
    }
    func panel(_ sender: Any, validate url: URL) throws {
        print(url, "validate url")
    }
}



struct ContentView: View {
    @State var listTrans: [Transaction] = []
    
    var body: some View {
        ScrollView {
            VStack {
                Button("select File")
                    {
                      let panel = NSOpenPanel()
                      panel.allowsMultipleSelection = false
                      panel.canChooseDirectories = false
                    panel.allowedFileTypes = ["xlsx"]
                      if panel.runModal() == .OK {
                        do {
                        var tmp = "\(panel.url!)".split(separator: "/")
                        tmp.removeFirst()
                        let path = tmp.joined(separator: "/")
                        let file = XLSXFile(filepath: "/\(path)")
                            
                        let sharedString = try file!.parseSharedStrings()
                        var i = 0
                        for wbk in try file!.parseWorkbooks() {
                            for (name, path) in try file!.parseWorksheetPathsAndNames(workbook: wbk) {
                                    let worksheet = try file!.parseWorksheet(at: path)
                                    for row in worksheet.data?.rows ?? [] {
                                        if i > 3 {
                                            let date = row.cells[3].stringValue(sharedString!)!
                                            let productName = row.cells[6].stringValue(sharedString!)!
                                            let qyt = row.cells[7].stringValue(sharedString!)!
                                            let price = row.cells[10].stringValue(sharedString!)!
                                            let netIncome = 20000

                                            let newTrans = Transaction(date: date, productName: productName, quantity: qyt, price: price, netIncome: netIncome)
                                            self.listTrans.append(newTrans)
                                        }
                                        i += 1
                                    }
                                }
                            }
                        } catch {
                          print(error)
                        }
                      }
                    }
//                    .padding()
//                    .background(Color(red: 0, green: 0, blue: 0.5))
//                    .foregroundColor(.white)
//                    .clipShape(Capsule())
                HStack () {
                    Text("Date")
                        .frame(width: 200, alignment: .leading)
                    Divider()
                        .frame(height: 22)
                    Text("Product Name")
                        .frame(width: 200, alignment: .leading)
                    Divider()
                        .frame(height: 22)
                    Text("Quantity")
                        .frame(width: 200, alignment: .leading)
                    Divider()
                        .frame(height: 22)
                    Text("Price")
                        .frame(width: 200, alignment: .leading)
                    Divider()
                        .frame(height: 22)
                    Text("Net Income")
                        .frame(width: 100, alignment: .leading)
                    
                    
                }
                .padding(6)
                .frame(alignment: .topLeading)
                Divider()
                    .frame(height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //          Table Content
                if self.listTrans.count > 0 {
                    ForEach(listTrans, id: \.self) { trans in
                        HStack () {
                            Text("\(trans.date)")
                                .frame(width: 200, alignment: .leading)
                            Divider()
                                .frame(height: 22)
                            Text(trans.productName)
                                .frame(width: 200, alignment: .leading)
                            Divider()
                                .frame(height: 22)
                            Text("\(trans.quantity)")
                                .frame(width: 200, alignment: .leading)
                            Divider()
                                .frame(height: 22)
                            Text("\(trans.price)")
                                .frame(width: 200, alignment: .leading)
                            Divider()
                                .frame(height: 22)
                            Text("\(73000)")
                                .frame(width: 100, alignment: .leading)
                        }
                        .padding(3)
                        .frame(alignment: .topLeading)
                        Divider()
                            .frame(height: 0)
                    }
                }
            }
            .frame(minWidth: 1012)
        }
        .frame(minHeight: 600, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
