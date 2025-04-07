//
//  WatchlistStore.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-04-07.
//

import Foundation
import SwiftUI

class WatchlistStore: ObservableObject {
    @Published var items: [Show] = []

    private let saveKey = "watchlist"

    init() {
        load()
    }

    func add(_ show: Show) {
        if !items.contains(where: { $0.trackId == show.trackId }) {
            items.append(show)
            save()
        }
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func load() {
        if let saved = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Show].self, from: saved) {
            items = decoded
        }
    }
}
