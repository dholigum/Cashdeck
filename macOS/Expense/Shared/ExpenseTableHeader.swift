//
//  ExpenseTableHeader.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 05/08/21.
//

import SwiftUI

struct ExpenseTableHeader: View {
    
    var dateWidth: Int = 160
    var categoryWidth: Int = 105
    var nameWidth: Int = 450
    var priceWidth: Int = 90
    var actionWidrh: Int = 118
    var leadingPadding: Int = 22
    
    var body: some View {
        HStack {
            Text("Date")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: CGFloat(dateWidth), alignment: .leading)
            
            Text("Category")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: CGFloat(categoryWidth), alignment: .leading)
            
            Text("Name")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: CGFloat(nameWidth), alignment: .leading)
            
            Text("Price")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: CGFloat(priceWidth), alignment: .leading)
            
            Text("")
                .font(Font.custom("SFProDisplay-Semibold", size: 16))
                .frame(width: CGFloat(actionWidrh), alignment: .leading)
        }
        .padding(EdgeInsets(top: 0, leading: CGFloat(leadingPadding), bottom: 16, trailing: 0))
    }
}

struct ExpenseTableHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTableHeader()
    }
}
