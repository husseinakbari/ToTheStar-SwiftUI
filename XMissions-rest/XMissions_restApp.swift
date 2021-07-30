//
//  XMissions_restApp.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

@main
struct XMissions_restApp: App {
    @StateObject private var contentVM = ContentVM()
    @StateObject private var backgroundVM = BackgroundVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentVM)
                .environmentObject(backgroundVM)
        }
    }
}
