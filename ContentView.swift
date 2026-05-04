//
//  Untitled.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var appData = AppData()

    var body: some View {
        TabView {
            NavigationStack {
                WeeklySummaryView()
                    .environmentObject(appData)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                ChatPlaceholderView()
                    .environmentObject(appData)
            }
            .tabItem {
                Label("Chat", systemImage: "message")
            }

            NavigationStack {
                HonourView()
                    .environmentObject(appData)
            }
            .tabItem {
                Label("Achieve", systemImage: "trophy")
            }
        }
        .tint(.blue)
    }
}
