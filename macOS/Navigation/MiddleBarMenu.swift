//
//  MiddleBarMenu.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct MiddleBarMenu: View {
    
    var seletedBar: String
    
    var body: some View {
        if seletedBar == "Books" {
            NavigationView {
                List {
                    NavigationLink(destination: SampleView(content: "Books")) {
                        Label("Books", systemImage: "book.closed")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Tutorials")) {
                        Label("Tutorials", systemImage: "list.bullet.rectangle")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Video Tutorials")) {
                        Label("Video Tutorials", systemImage: "tv")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Contacts")) {
                        Label("Contacts", systemImage: "mail.stack")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Search")) {
                        Label("Search", systemImage: "magnifyingglass")
                    } // NAVIGATIONLINK
                }
                .listStyle(SidebarListStyle())
            }
        } else {
            NavigationView {
                List {
                    NavigationLink(destination: SampleView(content: "Tutorials")) {
                        Label("Tutorials", systemImage: "list.bullet.rectangle")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Video Tutorials")) {
                        Label("Video Tutorials", systemImage: "tv")
                    } // NAVIGATIONLINK
                    NavigationLink(destination: SampleView(content: "Contacts")) {
                        Label("Contacts", systemImage: "mail.stack")
                    } // NAVIGATIONLINK
                }
                .listStyle(SidebarListStyle())
            }
        }
    }
}
