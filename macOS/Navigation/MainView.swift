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
                    .font(Font.title2.weight(.heavy))
                    .padding(.top)
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Books")) {
                    Label("Home", systemImage: "house")
                } // NAVIGATIONLINK
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Tutorials")) {
                    Label("Income", systemImage: "scroll")
                } // NAVIGATIONLINK
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Video Tutorials")) {
                    Label("Expense", systemImage: "dollarsign.circle")
                } // NAVIGATIONLINK
            }
            .listStyle(SidebarListStyle())
            .background(Color("AccentColor"))
            .frame(minWidth: 186)
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
