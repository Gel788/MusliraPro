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
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
                .tag(0)
            
            ConcertsView()
                .tabItem {
                    Image(systemName: "music.note.house.fill")
                    Text("Концерты")
                }
                .tag(1)
            
            ChatListView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Чаты")
                }
                .tag(2)
            
            PartnersView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Партнеры")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Профиль")
                }
                .tag(4)
        }
        .accentColor(.purple)
        .environmentObject(authManager)
    }
}
