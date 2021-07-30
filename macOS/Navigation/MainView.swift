//
//  MainVIew.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                Text("CashDeck")
                    .font(Font.title.weight(.heavy))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Home")) {
                    Label("Home", systemImage: "house")
                } // NAVIGATIONLINK
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Income")) {
                    Label("Income", systemImage: "scroll")
                } // NAVIGATIONLINK
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Expense")) {
                    Label("Expense", systemImage: "dollarsign.circle")
                } // NAVIGATIONLINK
            }
            .listStyle(SidebarListStyle())
            .background(Color("AccentColor"))
            .frame(width: 186)
        }
        .background(Color("MainColor"))
        .frame(minWidth: 1440, minHeight: 900)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
