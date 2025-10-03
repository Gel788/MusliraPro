//
//  MainTabView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var authManager = AuthenticationManager()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            UltimateHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            UltimateVideoArchiveView()
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Videos")
                }
                .tag(1)
            
            UltimateArtistsView()
                .tabItem {
                    Image(systemName: "music.mic")
                    Text("Artists")
                }
                .tag(2)
            
            UltimatePartnersView()
                .tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Partners")
                }
                .tag(3)
            
            UltimateProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.white)
        .environmentObject(authManager)
        .onAppear {
            // World-Class Tab Bar Styling
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            
            // Inactive items
            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.4)
            itemAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white.withAlphaComponent(0.4),
                .font: UIFont.systemFont(ofSize: 10, weight: .medium)
            ]
            
            // Selected items
            itemAppearance.selected.iconColor = UIColor.white
            itemAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
            ]
            
            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance
            
            // Subtle top border
            appearance.shadowColor = UIColor.white.withAlphaComponent(0.1)
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
