//
//  ExpenseTableHeader.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 05/08/21.
//

import SwiftUI

struct ExpenseTableHeader: View {
    var body: some View {
        HStack {
            Text("Date")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: 160, alignment: .leading)
            
            Text("Category")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(minWidth: 105, alignment: .leading)
            
            Text("Name")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(minWidth: 350, alignment: .leading)
            
            Text("Quantity")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(minWidth: 90, alignment: .leading)
            
            Text("Price")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(minWidth: 118, alignment: .leading)
            
            Text("")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(minWidth: 120, alignment: .leading)
        }
        .padding(EdgeInsets(top: 0, leading: 22, bottom: 16, trailing: 0))
    }
}

struct ExpenseTableHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTableHeader()
    }
}
