//
//  CashdeckApp.swift
//  Shared
//
//  Created by Syahrul Apple Developer BINUS on 21/07/21.
//

import SwiftUI

@main
struct CashdeckApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .background(Color("MainColor"))
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
