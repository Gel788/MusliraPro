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
    @State private var user = User(username: "Пользователь", email: "user@example.com")
    
    var body: some View {
        NavigationView {
            ZStack {
                // Современный светлый фон
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        if authManager.isAuthenticated {
                            // Современный профиль пользователя
                            VStack(spacing: 24) {
                                // Профильная карточка
                                VStack(spacing: 20) {
                                    // Аватар
                                    ZStack {
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.red, .orange]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 80, height: 80)
                                        
                                        Text("U")
                                            .font(.system(size: 32, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(spacing: 8) {
                                        Text("Пользователь")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                        
                                        Text("user@example.com")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        HStack(spacing: 6) {
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 6, height: 6)
                                            Text("Онлайн")
                                                .font(.caption)
                                                .fontWeight(.medium)
                                                .foregroundColor(.green)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.green.opacity(0.1))
                                        )
                                    }
                                }
                                .padding(24)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                )
                                
                                // Статистика
                                VStack(spacing: 16) {
                                    Text("Статистика")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    LazyVGrid(columns: [
                                        GridItem(.flexible()),
                                        GridItem(.flexible())
                                    ], spacing: 12) {
                                        ModernStatCard(
                                            title: "Баланс",
                                            value: "\(Int(user.balance)) ₽",
                                            icon: "dollarsign.circle.fill",
                                            color: .red
                                        )
                                        
                                        ModernStatCard(
                                            title: "Рефералы",
                                            value: "\(user.invitedFriends.count)",
                                            icon: "person.2.fill",
                                            color: .orange
                                        )
                                        
                                        ModernStatCard(
                                            title: "Заработано",
                                            value: "\(Int(user.totalEarnings)) ₽",
                                            icon: "chart.line.uptrend.xyaxis",
                                            color: .green
                                        )
                                        
                                        ModernStatCard(
                                            title: "Код",
                                            value: user.referralCode,
                                            icon: "qrcode",
                                            color: .blue
                                        )
                                    }
                                }
                                .padding(20)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                )
                                
                                // Кнопка выхода
                                Button(action: {
                                    authManager.logout()
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "arrow.right.square")
                                            .font(.title3)
                                        
                                        Text("Выйти из аккаунта")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.red.opacity(0.1))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                            )
                                    )
                                }
                            }
                        } else {
                            // Гостевой режим
                            VStack(spacing: 24) {
                                // Профильная карточка гостя
                                VStack(spacing: 20) {
                                    // Аватар гостя
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Г")
                                            .font(.system(size: 32, weight: .bold))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    VStack(spacing: 8) {
                                        Text("Гость")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                        
                                        Text("Войдите для полного доступа")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        HStack(spacing: 6) {
                                            Circle()
                                                .fill(Color.orange)
                                                .frame(width: 6, height: 6)
                                            Text("Ограниченный доступ")
                                                .font(.caption)
                                                .fontWeight(.medium)
                                                .foregroundColor(.orange)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.orange.opacity(0.1))
                                        )
                                    }
                                }
                                .padding(24)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                )
                                
                                // Доступные функции
                                VStack(spacing: 16) {
                                    Text("Доступные функции")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    LazyVGrid(columns: [
                                        GridItem(.flexible()),
                                        GridItem(.flexible())
                                    ], spacing: 12) {
                                        ModernFeatureCard(
                                            title: "Концерты",
                                            subtitle: "Просмотр афиш",
                                            icon: "music.note.house.fill",
                                            color: .green,
                                            isAvailable: true
                                        )
                                        
                                        ModernFeatureCard(
                                            title: "Партнеры",
                                            subtitle: "Список партнеров",
                                            icon: "person.2.fill",
                                            color: .blue,
                                            isAvailable: true
                                        )
                                        
                                        ModernFeatureCard(
                                            title: "Трансляции",
                                            subtitle: "Ограниченный просмотр",
                                            icon: "play.circle.fill",
                                            color: .orange,
                                            isAvailable: false
                                        )
                                        
                                        ModernFeatureCard(
                                            title: "Чаты",
                                            subtitle: "Требуется вход",
                                            icon: "message.fill",
                                            color: .purple,
                                            isAvailable: false
                                        )
                                    }
                                }
                                .padding(20)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                )
                                
                                // Кнопка входа
                                Button(action: {
                                    showingLogin = true
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "person.circle")
                                            .font(.title3)
                                        
                                        Text("Войти в аккаунт")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.red, .orange]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                    )
                                }
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

struct ModernStatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.1))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(color)
            }
            
            VStack(spacing: 4) {
                Text(value)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
    }
}

struct ModernFeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let isAvailable: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isAvailable ? color.opacity(0.1) : Color.gray.opacity(0.1))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(isAvailable ? color : .gray)
            }
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(isAvailable ? .primary : .gray)
                
                Text(subtitle)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isAvailable ? .secondary : .gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isAvailable ? Color(.systemGray6) : Color.gray.opacity(0.1))
        )
        .opacity(isAvailable ? 1.0 : 0.6)
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationManager())
}