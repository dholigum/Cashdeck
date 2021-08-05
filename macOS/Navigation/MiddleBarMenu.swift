//
//  MiddleBarMenu.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct MiddleBarMenu: View {
    
    var seletedBar: String
    
    @State private var selectedMenu: String = ""
    @State private var homeOption: HomeNavigationOptions.Option = (id:UUID(), "Overview", "home-overview", .overview)
    @State private var incomeOption: IncomeNavigationOptions.Option = (id:UUID(), "Tokopedia", "tokopedia", .tokopedia)
    @State private var expenseOption: ExpenseNavigationOptions.Option = (id:UUID(), "Overview", "expense-overview", .overview)
    @State private var showDetail: Bool = false
    
    var body: some View {
        if seletedBar == "Home" {
            NavigationView {
                ScrollView{
                    VStack (alignment:.leading) {
                        Text(seletedBar)
                            .font(Font.custom("SFProDisplay-Bold", size: 24))
                            .padding(.top, 19)
                            .padding(.bottom, 14)
                            .padding(.leading)
                            .foregroundColor(Color("AccentColor2"))

                        ForEach(HomeNavigationOptions.options, id: \.id) { option in
                            CardMenuButton(title: option.value, imageName: option.image, selectedMenu: $selectedMenu)
                                .onTapGesture {
                                    selectedMenu = option.value
                                    homeOption = option
                                    showDetail = true
                                }
                                .buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        NavigationLink("", destination: HomeNavigationOptions.buildView(for: homeOption), isActive: $showDetail)
                            .opacity(0)
                    }
                }
                // INITIAL DETAIL VIEW
                Text("Select option from the left")
            }
        } else if seletedBar == "Income" {
            NavigationView {
                ScrollView{
                    VStack (alignment:.leading) {
                        Text(seletedBar)
                            .font(Font.custom("SFProDisplay-Bold", size: 24))
                            .padding(.top, 19)
                            .padding(.bottom, 14)
                            .padding(.leading)
                            .foregroundColor(Color("AccentColor2"))

                        ForEach(IncomeNavigationOptions.options, id: \.id) { option in
                            CardMenuButton(title: option.value, imageName: option.image, selectedMenu: $selectedMenu)
                                .onTapGesture {
                                    selectedMenu = option.value
                                    incomeOption = option
                                    showDetail = true
                                }
                                .buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        NavigationLink("", destination: IncomeNavigationOptions.buildView(for: incomeOption), isActive: $showDetail)
                            .opacity(0)
                    }
                }
                // INITIAL DETAIL VIEW
                Text("Select option from the left")
            }
        } else {
            NavigationView {
                ScrollView{
                    VStack (alignment:.leading) {
                        Text(seletedBar)
                            .font(Font.custom("SFProDisplay-Bold", size: 24))
                            .padding(.top, 19)
                            .padding(.bottom, 14)
                            .padding(.leading)
                            .foregroundColor(Color("AccentColor2"))

                        ForEach(ExpenseNavigationOptions.options, id: \.id) { option in
                            CardMenuButton(title: option.value, imageName: option.image, selectedMenu: $selectedMenu)
                                .onTapGesture {
                                    selectedMenu = option.value
                                    expenseOption = option
                                    showDetail = true
                                }
                                .buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        NavigationLink("", destination: ExpenseNavigationOptions.buildView(for: expenseOption), isActive: $showDetail)
                            .opacity(0)
                    }
                }
                // INITIAL DETAIL VIEW
                Text("Select option from the left")
            }
        }
    }
}
