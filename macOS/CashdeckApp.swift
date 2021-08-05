//
//  CashdeckApp.swift
//  Shared
//
//  Created by Syahrul Apple Developer BINUS on 21/07/21.
//

import SwiftUI

@main
struct CashdeckApp: App {
    
    init() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count - 1] as URL)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.light)
 
                .background(Color("MainColor"))
                .preferredColorScheme(.light)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
