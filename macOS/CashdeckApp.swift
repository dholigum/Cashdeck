//
//  CashdeckApp.swift
//  Shared
//
//  Created by Syahrul Apple Developer BINUS on 21/07/21.
//

import SwiftUI

@main
struct CashdeckApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .background(Color("MainColor"))
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
