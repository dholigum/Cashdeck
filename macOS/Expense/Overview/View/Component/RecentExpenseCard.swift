//
//  RecentExpenseCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct RecentExpenseCard: View {
    var body: some View {
        VStack {
            Text("RecentExpenseCard")
        }
        .frame(width: 600, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct RecentExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentExpenseCard()
    }
}
