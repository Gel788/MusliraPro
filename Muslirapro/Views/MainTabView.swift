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
            
            VideoArchiveView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Видеоархив")
                }
                .tag(1)
            
            ArtistsView()
                .tabItem {
                    Image(systemName: "music.note.house.fill")
                    Text("Артисты")
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
                    Text("Личный кабинет")
                }
                .tag(4)
        }
        .accentColor(.red)
        .environmentObject(authManager)
    }
}
