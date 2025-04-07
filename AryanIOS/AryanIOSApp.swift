//
//  AryanIOSApp.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import SwiftUI

@main
struct AryanIOSApp: App {
    @StateObject private var watchlist = WatchlistStore()
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environmentObject(watchlist)
        }
    }
}
