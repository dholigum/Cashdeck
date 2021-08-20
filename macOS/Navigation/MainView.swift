//
//  MainVIew.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTabButton: String = ""
    @State private var mainOption: MainNavigationOptions.Option = (id:UUID(), "Home", "home", .home)
    @State private var showDetail: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment:.leading) {
                    Text("CashDeck")
                        .font(Font.custom("SFProDisplay-Bold", size: 24))
                        .padding(.leading)
                        .padding(.vertical)
                        .foregroundColor(Color("AccentColor2"))
                    
                    ForEach(MainNavigationOptions.options, id: \.id) { option in
                        SideBarButton(iconImg: option.image, title: option.value, selectedTabButton: $selectedTabButton)
                            .onTapGesture {
                                selectedTabButton = option.value
                                mainOption = option
                                showDetail = true
                            }
                            .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                    NavigationLink("", destination: MainNavigationOptions.buildView(for: mainOption), isActive: $showDetail)
                        .opacity(0)
                }
            }
            .frame(width: 186)
            .padding(.all, 10)
            .background(Color("AccentColor"))
            
            // INITIAL DETAIL VIEW
            InitialView()
        }
        .frame(minWidth: 1460, minHeight: 900)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
