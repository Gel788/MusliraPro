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
                UltimateWelcomeView()
                    .onAppear {
                        // Показываем экран приветствия 2.5 секунды
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
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
