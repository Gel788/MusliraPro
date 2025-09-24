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
            // Элегантный градиентный фон
            ZStack {
                // Основной градиент
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color(red: 0.05, green: 0.05, blue: 0.1),
                        Color(red: 0.1, green: 0.05, blue: 0.15)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // Элегантные блики
                RadialGradient(
                    gradient: Gradient(colors: [
                        Color.red.opacity(0.1),
                        Color.clear
                    ]),
                    center: .topTrailing,
                    startRadius: 100,
                    endRadius: 400
                )
                .ignoresSafeArea()
                
                RadialGradient(
                    gradient: Gradient(colors: [
                        Color.orange.opacity(0.05),
                        Color.clear
                    ]),
                    center: .bottomLeading,
                    startRadius: 150,
                    endRadius: 500
                )
                .ignoresSafeArea()
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                // Основной контент
                VStack(spacing: 40) {
                    // Логотип Muslira
                    VStack(spacing: 20) {
                        ZStack {
                            // Элегантный фон логотипа
                            RoundedRectangle(cornerRadius: 40)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 0.9, green: 0.1, blue: 0.1),
                                            Color(red: 0.8, green: 0.3, blue: 0.1),
                                            Color(red: 0.7, green: 0.5, blue: 0.1)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 220, height: 220)
                                .shadow(color: .red.opacity(0.3), radius: 40, x: 0, y: 20)
                                .shadow(color: .orange.opacity(0.2), radius: 60, x: 0, y: 30)
                            
                            // Элегантные блики
                            RoundedRectangle(cornerRadius: 40)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.15),
                                            Color.clear,
                                            Color.white.opacity(0.08)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 220, height: 220)
                            
                            // Дополнительный блик
                            RoundedRectangle(cornerRadius: 40)
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.1),
                                            Color.clear
                                        ]),
                                        center: .topLeading,
                                        startRadius: 0,
                                        endRadius: 100
                                    )
                                )
                                .frame(width: 220, height: 220)
                            
                            // Логотип
                            VStack(spacing: 8) {
                                Image("Logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 140)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                                
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
                    
                    // Элегантная кнопка входа
                    Button(action: {
                        navigateToMain = true
                    }) {
                        HStack(spacing: 16) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Начать")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                        .background(
                            ZStack {
                                // Основной градиент
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.9, green: 0.2, blue: 0.2),
                                                Color(red: 0.8, green: 0.4, blue: 0.1)
                                            ]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                // Элегантный блик
                                RoundedRectangle(cornerRadius: 25)
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
                                
                                // Граница
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.3),
                                                Color.white.opacity(0.1)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                            }
                        )
                        .shadow(color: .red.opacity(0.4), radius: 20, x: 0, y: 10)
                        .shadow(color: .orange.opacity(0.2), radius: 30, x: 0, y: 15)
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
