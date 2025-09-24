//
//  WelcomeView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isAnimating = false
    @State private var showContent = false
    @State private var showSignature = false
    @State private var navigateToMain = false
    
    var body: some View {
        ZStack {
            // Современный градиентный фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black,
                    Color.red.opacity(0.1),
                    Color.orange.opacity(0.05)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Основной контент
                VStack(spacing: 40) {
                    // Логотип Muslira
                    VStack(spacing: 20) {
                        ZStack {
                            // Элитный фон логотипа
                            RoundedRectangle(cornerRadius: 30)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.red.opacity(0.9),
                                            Color.orange.opacity(0.8),
                                            Color.yellow.opacity(0.7)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .shadow(color: .red.opacity(0.4), radius: 30, x: 0, y: 15)
                            
                            // Неоновые блики
                            RoundedRectangle(cornerRadius: 30)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.2),
                                            Color.clear,
                                            Color.white.opacity(0.1)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 200, height: 200)
                            
                            // Текст логотипа
                            VStack(spacing: 8) {
                                Text("Муз")
                                    .font(.system(size: 36, weight: .black, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("Лира")
                                    .font(.system(size: 36, weight: .black, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("Pro")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(.white.opacity(0.9))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.2))
                                    )
                            }
                        }
                        .scaleEffect(isAnimating ? 1.05 : 1.0)
                        .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: isAnimating)
                        
                        // Подзаголовок
                        VStack(spacing: 12) {
                            Text("Музыкальная платформа")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("нового поколения")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .opacity(showContent ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 1.0).delay(0.5), value: showContent)
                    }
                    
                    // Описание
                    VStack(spacing: 16) {
                        Text("Добро пожаловать в мир музыки!")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("Трансляции • Артисты • Партнеры • Сообщество")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                    }
                    .opacity(showContent ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0).delay(1.0), value: showContent)
                    
                    // Кнопка входа
                    Button(action: {
                        navigateToMain = true
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title2)
                            
                            Text("Начать")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.2),
                                                Color.clear
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                        )
                        .shadow(color: .red.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .opacity(showContent ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0).delay(1.5), value: showContent)
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                
                // Подпись By Anna Simonyan
                VStack(spacing: 8) {
                    Text("By Anna Simonyan")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text("© 2025 Muslira Pro")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.4))
                }
                .opacity(showSignature ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 1.0).delay(2.0), value: showSignature)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            startAnimations()
        }
        .fullScreenCover(isPresented: $navigateToMain) {
            MainTabView()
        }
    }
    
    private func startAnimations() {
        withAnimation {
            isAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                showContent = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                showSignature = true
            }
        }
    }
}

#Preview {
    WelcomeView()
}
