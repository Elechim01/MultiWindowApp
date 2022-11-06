//
//  MultiWindowAppApp.swift
//  MultiWindowApp
//
//  Created by Michele Manniello on 06/11/22.
//

import SwiftUI

@main
struct MultiWindowAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
        
//        MARK: Multi-Tab Window Group
        WindowGroup(id: "New Tab", for: Tab.self) { $tab in
            NewTabView(tab: tab,isRootView: false)
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
    }
}
