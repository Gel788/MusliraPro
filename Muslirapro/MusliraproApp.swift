//
//  MusliraproApp.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

@main
struct MusliraproApp: App {
    @State private var showWelcome = true
    
    var body: some Scene {
        WindowGroup {
            if showWelcome {
                WelcomeView()
                    .onAppear {
                        // Показываем экран приветствия 3 секунды
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showWelcome = false
                            }
                        }
                    }
            } else {
                MainTabView()
            }
        }
    }
}
