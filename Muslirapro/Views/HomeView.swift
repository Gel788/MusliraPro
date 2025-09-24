//
//  HomeView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var selectedStream: StreamItem?
    @State private var currentTime = Date()
    @State private var isLiveStreamActive = true
    
    let streams = [
        StreamItem(
            title: "🔥 Прямой эфир: Электронная ночь",
            artist: "DJ Муз Лира",
            isLive: true,
            viewers: 2847,
            imageURL: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop",
            duration: "2:45:12"
        ),
        StreamItem(
            title: "🎸 Акустический вечер",
            artist: "Группа 'Мелодия'",
            isLive: false,
            viewers: 0,
            imageURL: "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=300&fit=crop",
            duration: "1:23:45"
        ),
        StreamItem(
            title: "🎵 Мастер-класс: Создание битов",
            artist: "Producer Pro",
            isLive: false,
            viewers: 0,
            imageURL: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=300&fit=crop",
            duration: "3:15:30"
        ),
        StreamItem(
            title: "🎤 Интервью с артистами",
            artist: "Music Talk Show",
            isLive: false,
            viewers: 0,
            imageURL: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=300&fit=crop",
            duration: "45:20"
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Неоновый градиентный фон "Муз Лира"
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color.red.opacity(0.15),
                        Color.orange.opacity(0.1),
                        Color.yellow.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Элитный хедер мирового уровня
                        VStack(spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Text("✨")
                                            .font(.title2)
                                        Text("Добро пожаловать в")
                                            .font(.title3)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                    
                                    Text("Муз Лира")
                                        .font(.system(size: 36, weight: .black, design: .rounded))
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.white, .red, .orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                    
                                    Text("🎵 Музыкальная платформа нового поколения")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 12) {
                                    Button(action: {}) {
                                        ZStack {
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [.white.opacity(0.3), .white.opacity(0.1)]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .frame(width: 50, height: 50)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                )
                                            
                                            Image(systemName: "bell.fill")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .scaleEffect(1.0)
                                    .animation(.easeInOut(duration: 0.2), value: currentTime)
                                    
                                    Button(action: {}) {
                                        ZStack {
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [.white.opacity(0.3), .white.opacity(0.1)]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .frame(width: 50, height: 50)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                )
                                            
                                            Image(systemName: "person.circle.fill")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .scaleEffect(1.0)
                                    .animation(.easeInOut(duration: 0.2), value: currentTime)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 24)
                            .background(
                                ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.red.opacity(0.9),
                                                        Color.orange.opacity(0.8),
                                                        Color.yellow.opacity(0.7),
                                                        Color.red.opacity(0.6)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    
                                    // Премиальные блики
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
                            .shadow(color: .red.opacity(0.4), radius: 20, x: 0, y: 10)
                            .padding(.horizontal)
                        }
                        
                        // Неоновая секция трансляций
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                HStack(spacing: 8) {
                                    Text("🔥")
                                        .font(.title2)
                                    Text("Прямой эфир")
                                        .font(.title2)
                                        .fontWeight(.black)
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.red, .orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Переход к видеоархиву
                                }) {
                                    HStack(spacing: 6) {
                                        Text("Видеоархив")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Image(systemName: "arrow.right")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
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
                            .padding(.horizontal, 24)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(streams) { stream in
                                        PremiumStreamCard(stream: stream) {
                                            selectedStream = stream
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                        }
                        
                        // Неоновые быстрые действия
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                HStack(spacing: 8) {
                                    Text("⚡")
                                        .font(.title2)
                                    Text("Быстрые действия")
                                        .font(.title2)
                                        .fontWeight(.black)
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.red, .orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 24)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 20) {
                                PremiumQuickActionCard(
                                    title: "💬 Чат поддержки",
                                    subtitle: "Помощь 24/7",
                                    icon: "headphones",
                                    gradient: [Color.red, Color.orange],
                                    accentColor: .red
                                ) {
                                    // Переход к чату поддержки
                                }
                                
                                PremiumQuickActionCard(
                                    title: "🎵 Чат музыкантов",
                                    subtitle: "Общение с коллегами",
                                    icon: "music.note",
                                    gradient: [Color.orange, Color.yellow],
                                    accentColor: .orange
                                ) {
                                    // Переход к чату музыкантов
                                }
                                
                                PremiumQuickActionCard(
                                    title: "📹 Видеоархив",
                                    subtitle: "Загруженные выступления",
                                    icon: "video.fill",
                                    gradient: [Color.yellow, Color.red],
                                    accentColor: .yellow
                                ) {
                                    // Переход к видеоархиву
                                }
                                
                                PremiumQuickActionCard(
                                    title: "💰 Баланс",
                                    subtitle: "Виртуальная валюта",
                                    icon: "dollarsign.circle.fill",
                                    gradient: [Color.red, Color.pink],
                                    accentColor: .red
                                ) {
                                    // Переход к личному кабинету
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Муз Лира")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(item: $selectedStream) { stream in
            StreamDetailView(stream: stream)
        }
    }
}

struct StreamItem: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let isLive: Bool
    let viewers: Int
    let imageURL: String
    let duration: String
}

struct PremiumStreamCard: View {
    let stream: StreamItem
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    // Премиальное фоновое изображение
                    AsyncImage(url: URL(string: stream.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
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
                    }
                    .frame(width: 280, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // Элитный градиентный оверлей
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.2),
                                    Color.black.opacity(0.4),
                                    Color.black.opacity(0.7)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 280, height: 180)
                    
                    VStack {
                        HStack {
                            if stream.isLive {
                                HStack(spacing: 8) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 10, height: 10)
                                        .shadow(color: .red, radius: 6)
                                    Text("LIVE")
                                        .font(.caption)
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.black.opacity(0.7))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.red.opacity(0.5), lineWidth: 1)
                                        )
                                )
                            }
                            
                            Spacer()
                            
                            if !stream.isLive {
                                Text(stream.duration)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.black.opacity(0.7))
                                    )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        
                        Spacer()
                        
                        // Премиальная кнопка воспроизведения
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.white, .white.opacity(0.9)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 60, height: 60)
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                            
                            Image(systemName: stream.isLive ? "play.circle.fill" : "play.circle")
                                .font(.system(size: 32))
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.purple, .blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                        .padding(.bottom, 20)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(stream.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text(stream.artist)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    HStack {
                        if stream.isLive {
                            HStack(spacing: 6) {
                                Image(systemName: "eye.fill")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                Text("\(stream.viewers) зрителей")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                            }
                        } else {
                            HStack(spacing: 6) {
                                Image(systemName: "clock.fill")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                Text(stream.duration)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                    }
                }
                .frame(width: 280, alignment: .leading)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

struct PremiumQuickActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let gradient: [Color]
    let accentColor: Color
    let action: () -> Void
    @State private var isPressed = false
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 16) {
                ZStack {
                    // Премиальный градиентный фон
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
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
                        )
                    
                    // Элитная иконка
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.white, .white.opacity(0.9)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 60, height: 60)
                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        
                        Image(systemName: icon)
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: gradient),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    }
                }
                
                VStack(spacing: 6) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.systemGray6))
                    
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.1),
                                    Color.clear,
                                    Color.white.opacity(0.05)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                }
            )
            .shadow(color: accentColor.opacity(0.2), radius: 15, x: 0, y: 8)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : (isHovered ? 1.05 : 1.0))
        .animation(.easeInOut(duration: 0.2), value: isPressed)
        .animation(.easeInOut(duration: 0.3), value: isHovered)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

struct StreamDetailView: View {
    let stream: StreamItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 250)
                    
                    VStack {
                        if stream.isLive {
                            HStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 12, height: 12)
                                Text("LIVE")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                        
                        Text("\(stream.viewers) зрителей")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(stream.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(stream.artist)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Здесь будет интегрирован видеоплеер для трансляций с сайта MusliraPro")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Трансляция")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthenticationManager())
}
