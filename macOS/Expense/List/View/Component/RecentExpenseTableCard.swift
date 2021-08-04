//
//  RecentExpenseTableCard.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct RecentExpenseTableCard: View {
    var body: some View {
        VStack {
            Text("RecentExpenseTableCard")
        }
        .frame(width: 1012, height: 597)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
}

struct RecentExpenseTableCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentExpenseTableCard()
    }
}