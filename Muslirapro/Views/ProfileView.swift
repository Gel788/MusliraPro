//
//  ProfileView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var showingLogin = false
    @State private var currentTime = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Премиальный градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color.purple.opacity(0.1),
                        Color.blue.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        if authManager.isAuthenticated {
                            // Элитный профиль авторизованного пользователя
                            VStack(spacing: 24) {
                                // Премиальный хедер профиля
                                VStack(spacing: 20) {
                                    ZStack {
                                        // Элитный аватар с градиентом
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.purple,
                                                        Color.blue,
                                                        Color.pink
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 120, height: 120)
                                            .overlay(
                                                Circle()
                                                    .stroke(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [.white, .white.opacity(0.3)]),
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        ),
                                                        lineWidth: 4
                                                    )
                                            )
                                            .shadow(color: .purple.opacity(0.4), radius: 20, x: 0, y: 10)
                                        
                                        Text("U")
                                            .font(.system(size: 48, weight: .black))
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(spacing: 12) {
                                        Text("Пользователь")
                                            .font(.title)
                                            .fontWeight(.black)
                                            .foregroundStyle(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.white, .purple.opacity(0.8)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                        
                                        Text("user@example.com")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))
                                        
                                        HStack(spacing: 8) {
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 8, height: 8)
                                            Text("Онлайн")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white.opacity(0.9))
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.green.opacity(0.2))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                                                )
                                        )
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 32)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.purple.opacity(0.9),
                                                        Color.blue.opacity(0.8),
                                                        Color.pink.opacity(0.7)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 24)
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
                                    }
                                )
                                .shadow(color: .purple.opacity(0.3), radius: 20, x: 0, y: 10)
                                
                                // Премиальные статистики
                                LazyVGrid(columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ], spacing: 16) {
                                    PremiumStatCard(
                                        title: "Трансляции",
                                        value: "12",
                                        icon: "play.circle.fill",
                                        gradient: [.blue, .cyan]
                                    )
                                    
                                    PremiumStatCard(
                                        title: "Концерты",
                                        value: "8",
                                        icon: "music.note.house.fill",
                                        gradient: [.green, .mint]
                                    )
                                    
                                    PremiumStatCard(
                                        title: "Сообщения",
                                        value: "156",
                                        icon: "message.fill",
                                        gradient: [.orange, .yellow]
                                    )
                                    
                                    PremiumStatCard(
                                        title: "Подписка",
                                        value: "Pro",
                                        icon: "crown.fill",
                                        gradient: [.purple, .pink]
                                    )
                                }
                                .padding(.horizontal)
                                
                                // Элитная кнопка выхода
                                Button(action: {
                                    authManager.logout()
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "arrow.right.square.fill")
                                            .font(.title3)
                                        
                                        Text("Выйти из аккаунта")
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
                                                        gradient: Gradient(colors: [.red, .red.opacity(0.8)]),
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
                                .padding(.horizontal)
                            }
                        } else {
                            // Элитный гостевой режим
                            VStack(spacing: 24) {
                                // Премиальный хедер гостя
                                VStack(spacing: 20) {
                                    ZStack {
                                        // Элитный аватар гостя
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.gray,
                                                        Color.gray.opacity(0.7),
                                                        Color.gray.opacity(0.5)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 120, height: 120)
                                            .overlay(
                                                Circle()
                                                    .stroke(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [.white, .white.opacity(0.3)]),
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        ),
                                                        lineWidth: 4
                                                    )
                                            )
                                            .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 10)
                                        
                                        Text("Г")
                                            .font(.system(size: 48, weight: .black))
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(spacing: 12) {
                                        Text("Гость")
                                            .font(.title)
                                            .fontWeight(.black)
                                            .foregroundStyle(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.white, .gray.opacity(0.8)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                        
                                        Text("Войдите для полного доступа")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))
                                        
                                        HStack(spacing: 8) {
                                            Circle()
                                                .fill(Color.orange)
                                                .frame(width: 8, height: 8)
                                            Text("Ограниченный доступ")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white.opacity(0.9))
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.orange.opacity(0.2))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                                )
                                        )
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 32)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.gray.opacity(0.9),
                                                        Color.gray.opacity(0.7),
                                                        Color.gray.opacity(0.5)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 24)
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
                                    }
                                )
                                .shadow(color: .gray.opacity(0.3), radius: 20, x: 0, y: 10)
                                
                                // Премиальные возможности для гостей
                                VStack(spacing: 16) {
                                    Text("Доступные функции")
                                        .font(.title2)
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 8)
                                    
                                    LazyVGrid(columns: [
                                        GridItem(.flexible()),
                                        GridItem(.flexible())
                                    ], spacing: 16) {
                                        PremiumFeatureCard(
                                            title: "Концерты",
                                            subtitle: "Просмотр афиш",
                                            icon: "music.note.house.fill",
                                            gradient: [.green, .mint],
                                            isAvailable: true
                                        )
                                        
                                        PremiumFeatureCard(
                                            title: "Партнеры",
                                            subtitle: "Список партнеров",
                                            icon: "person.2.fill",
                                            gradient: [.blue, .cyan],
                                            isAvailable: true
                                        )
                                        
                                        PremiumFeatureCard(
                                            title: "Трансляции",
                                            subtitle: "Ограниченный просмотр",
                                            icon: "play.circle.fill",
                                            gradient: [.orange, .yellow],
                                            isAvailable: false
                                        )
                                        
                                        PremiumFeatureCard(
                                            title: "Чаты",
                                            subtitle: "Требуется вход",
                                            icon: "message.fill",
                                            gradient: [.purple, .pink],
                                            isAvailable: false
                                        )
                                    }
                                }
                                .padding(.horizontal)
                                
                                // Элитная кнопка входа
                                Button(action: {
                                    showingLogin = true
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "person.circle.fill")
                                            .font(.title3)
                                        
                                        Text("Войти в аккаунт")
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
                                                        gradient: Gradient(colors: [.purple, .blue]),
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
                                    .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 5)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $showingLogin) {
            LoginView()
        }
    }
}

struct PremiumStatCard: View {
    let title: String
    let value: String
    let icon: String
    let gradient: [Color]
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                        .shadow(color: gradient.first?.opacity(0.3) ?? .clear, radius: 8, x: 0, y: 4)
                    
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 4) {
                    Text(value)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                    Text(title)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    gradient.first?.opacity(0.9) ?? .purple,
                                    gradient.last?.opacity(0.7) ?? .blue
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.1),
                                    Color.clear
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                }
            )
            .shadow(color: gradient.first?.opacity(0.2) ?? .purple, radius: 10, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

struct PremiumFeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let gradient: [Color]
    let isAvailable: Bool
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: isAvailable ? gradient : [.gray, .gray.opacity(0.7)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                    .shadow(color: isAvailable ? (gradient.first?.opacity(0.3) ?? .clear) : .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: isAvailable ? [
                                gradient.first?.opacity(0.9) ?? .purple,
                                gradient.last?.opacity(0.7) ?? .blue
                            ] : [
                                Color.gray.opacity(0.9),
                                Color.gray.opacity(0.7)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.1),
                                Color.clear
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            }
        )
        .shadow(color: isAvailable ? gradient.first?.opacity(0.2) ?? .purple : .gray.opacity(0.2), radius: 10, x: 0, y: 5)
        .opacity(isAvailable ? 1.0 : 0.6)
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationManager())
}