//
//  EntryView.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import SwiftUI


struct EntryView: View {
    var body: some View {
        TabView{

            ContentView()
                .tabItem {
                    Label("Movie Search", systemImage: "magnifyingglass.circle")
                }

            WatchlistView()
                .tabItem {
                    Label("Watchlist", systemImage: "star.circle.fill")
                }
        }
        }
    }
    

#Preview {
    EntryView()
}

