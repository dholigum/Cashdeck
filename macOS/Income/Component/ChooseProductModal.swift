//
//  ChooseProductModal.swift
//  Cashdeck
//
//  Created by Azrullah Kainage on 05/08/21.
//

import SwiftUI

struct ChooseProductModal: View {
    
//    @Binding var listProduct: [Products]
    struct Names: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    @State private var names = [
        Names(name: "Pacific"),
        Names(name: "Atlantic"),
        Names(name: "Indian"),
        Names(name: "Southern"),
        Names(name: "Arctic")
    ]
    @State var text: String
    
    let namess = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh", "iii", "jjj", "kkk", "lll", "mmm", "nnn", "ooo"]
    
    @State private var isEditing = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                }, label: {
                    Text("Cancel")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
                
                Text("Sync")
                    .foregroundColor(Color("AccentColor2"))
                    .font(Font.custom("SFProDisplay-Semibold", size: 18))
                
                Spacer()
                
                Button(action: {
                }, label: {
                    Text("Save")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
            } // Sheet Header
            .frame(width: .infinity, height: 50)
            .background(Color("AccentColor"))
            
            HStack {
                TextField("Search ...", text: $text)
                    .background(Color("systemGray6"))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .font(.title2)
            }
            
//            List(names) {
//                Text($0.name)
//            }
            
            ScrollView {
                ForEach(namess, id: \.self) { row in
                    if(text == ""){
                        VStack {
                            Text(row)
                                .frame(width: 450, height: 25, alignment: .leading)
                                .font(.title2)
                                .padding(.top, 10)
                            Divider()
                        }
                        .background(Color(CGColor.white))
                    } else if (text != "" && "\(row)".contains(text)) {
                        VStack {
                            Text(row)
                                .frame(width: 450, height: 25, alignment: .leading)
                                .font(.title2)
                                .padding(.top, 10)
                            Divider()
                        }
                        .background(Color(CGColor.white))
                    }
                }
            }
            .background(Color(CGColor.white))
            .padding(.horizontal, 10)
            .frame(width: .infinity, height: 550, alignment: .leading)
            
            
            Spacer()
            
//            Button(action: {}, label: {
//                Text("Save Expense")
//                    .foregroundColor(Color("AccentColor2"))
//                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
//                    .frame(width: 358, height: 50)
//                    .background(Color("AccentColor"))
//                    .clipped()
//                    .cornerRadius(16)
//                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
//                    .padding(.bottom)
//            })
//            .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 500, height: .infinity)
        .background(Color("MainColor"))
    }
}



struct ChooseProductModal_Previews: PreviewProvider {
    static var previews: some View {
        ChooseProductModal(text: "")
    }
}
