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
          
            Tab("Movie Search", systemImage: "magnifyingglass.circle"){
                ContentView()
            }
            
        }
    }
    }

#Preview {
    EntryView()
}

