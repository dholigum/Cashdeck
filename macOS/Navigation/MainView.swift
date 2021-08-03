//
//  MainVIew.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTabButton: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Text("CashDeck")
                    .font(Font.title.weight(.heavy))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Home")
                                .onAppear() { selectedTabButton = "Home" }) {
                    SideBarButton(iconImg: "house", title: "Home", selectedTabButton: $selectedTabButton) }
                
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Income")
                                .onAppear() { selectedTabButton = "Income" }) {
                    SideBarButton(iconImg: "scroll", title: "Income", selectedTabButton: $selectedTabButton) }
                
                NavigationLink(destination: MiddleBarMenu(seletedBar: "Expense")
                                .onAppear() { selectedTabButton = "Expense" }) {
                    SideBarButton(iconImg: "dollarsign.circle", title: "Expense", selectedTabButton: $selectedTabButton) }
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
