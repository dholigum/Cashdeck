//
//  Home.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 22/07/21.
//

import SwiftUI

struct Home: View {
    
    // Getting Window Size ...
    var window = NSScreen.main?.visibleFrame
    
    @State var selectedSideBar = "Home"
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            
            SideBar()
            
            Spacer(minLength: 0)
            
            Text("Content")
            
            Spacer(minLength: 0)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.5,
               height: window!.height / 1.25)
        .background(Color.white.opacity(0.6))
        .background(BlurWindow())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct SideBar: View {
    
    @State var selected = "Home"
    
    var body: some View {
        HStack {
            VStack(spacing: 20) {
                HStack {
                    Image("cash-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    
                    Text("CashDeck")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                } // Hstack header
                .padding(.top, 30)
                .padding(.leading)
                
                // TabButton
                TabButton(iconImage: "house.fill", title: "Home", selected: $selected)
                TabButton(iconImage: "list.bullet.rectangle", title: "Income", selected: $selected)
                TabButton(iconImage: "dollarsign.circle", title: "Expense", selected: $selected)
                
                Spacer()
            }
            
            Divider()
        } // Hstack Side Bar
        .frame(width: 240)
        .background(Color.white)
    }
}
