//
//  WatchlistView.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-04-07.
//

import SwiftUI

struct WatchlistView: View {
    @EnvironmentObject var watchlist: WatchlistStore

    var body: some View {
        NavigationStack {
            List {
                ForEach(watchlist.items) { show in
                    VStack(alignment: .leading) {
                        Text(show.trackName).font(.headline)
                        Text(show.collectionName).font(.subheadline)
                    }
                }
                .onDelete(perform: watchlist.remove)
            }
            .navigationTitle("Watchlist - \(watchlist.items.count) \(watchlist.items.count == 1 ? "show" : "shows")")
        }
    }
}

#Preview {
    WatchlistView()
}
