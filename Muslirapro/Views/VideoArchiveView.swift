//
//  VideoArchiveView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct VideoArchiveView: View {
    @State private var videos: [VideoItem] = []
    @State private var selectedVideo: VideoItem?
    @State private var searchText = ""
    @State private var selectedCategory: VideoCategory?
    
    var filteredVideos: [VideoItem] {
        var filtered = videos
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { video in
                video.title.localizedCaseInsensitiveContains(searchText) ||
                video.artist.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return filtered
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Неоновый градиентный фон
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
                
                VStack {
                    if videos.isEmpty {
                        // Элитная заглушка
                        VStack(spacing: 30) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red.opacity(0.2), .orange.opacity(0.1)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 120, height: 120)
                                
                                Image(systemName: "video.fill")
                                    .font(.system(size: 50))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            }
                            
                            VStack(spacing: 16) {
                                Text("📹 Видеоархив пуст!")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("✨ Загруженные выступления появятся здесь")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(filteredVideos) { video in
                                    PremiumVideoCard(video: video) {
                                        selectedVideo = video
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .navigationTitle("📹 Видеоархив")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "🔍 Поиск видео...")
            .onAppear {
                loadSampleVideos()
            }
            .sheet(item: $selectedVideo) { video in
                VideoDetailView(video: video)
            }
        }
    }
    
    private func loadSampleVideos() {
        // Крутые моковые данные для видеоархива
        videos = [
            VideoItem(
                title: "🔥 Электронная ночь в Москве",
                artist: "DJ Муз Лира",
                duration: "2:45:12",
                videoURL: "https://example.com/video1",
                category: .performance
            ),
            VideoItem(
                title: "🎸 Акустический вечер",
                artist: "Группа 'Мелодия'",
                duration: "1:23:45",
                videoURL: "https://example.com/video2",
                category: .performance
            ),
            VideoItem(
                title: "🎵 Мастер-класс: Создание битов",
                artist: "Producer Pro",
                duration: "3:15:30",
                videoURL: "https://example.com/video3",
                category: .tutorial
            ),
            VideoItem(
                title: "🎤 Интервью с артистами",
                artist: "Music Talk Show",
                duration: "45:20",
                videoURL: "https://example.com/video4",
                category: .interview
            ),
            VideoItem(
                title: "🎬 За кулисами концерта",
                artist: "Behind the Scenes",
                duration: "15:30",
                videoURL: "https://example.com/video5",
                category: .behind_scenes
            )
        ]
        
        // Добавляем красивые изображения для видео
        videos[0].thumbnailURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop"
        videos[1].thumbnailURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=300&fit=crop"
        videos[2].thumbnailURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=300&fit=crop"
        videos[3].thumbnailURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=300&fit=crop"
        videos[4].thumbnailURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop"
        
        // Добавляем просмотры
        videos[0].views = 15420
        videos[1].views = 8930
        videos[2].views = 25670
        videos[3].views = 12450
        videos[4].views = 5670
    }
}

struct PremiumVideoCard: View {
    let video: VideoItem
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                // Премиальное изображение видео
                ZStack {
                    AsyncImage(url: URL(string: video.thumbnailURL ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        video.category.color.opacity(0.9),
                                        video.category.color.opacity(0.7),
                                        video.category.color.opacity(0.5)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // Неоновый градиентный оверлей
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.2),
                                    Color.black.opacity(0.4),
                                    Color.black.opacity(0.6)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: 200)
                    
                    VStack {
                        HStack {
                            Spacer()
                            // Категория видео
                            Text(video.category.displayName)
                                .font(.caption)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(video.category.color.opacity(0.8))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        
                        Spacer()
                        
                        // Кнопка воспроизведения
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
                            
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 32))
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.red, .orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                        .padding(.bottom, 20)
                    }
                }
                
                // Информационная панель
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(video.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text(video.artist)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        HStack(spacing: 6) {
                            Image(systemName: "clock.fill")
                                .font(.caption)
                                .foregroundColor(.red)
                            Text(video.duration)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Image(systemName: "eye.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                            Text("\(video.views) просмотров")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
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
                        )
                )
            }
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .shadow(color: video.category.color.opacity(0.2), radius: 20, x: 0, y: 10)
    }
}

struct VideoDetailView: View {
    let video: VideoItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.red.opacity(0.8), Color.orange.opacity(0.6)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 250)
                    
                    VStack {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                        
                        Text("\(video.views) просмотров")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(video.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(video.artist)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Здесь будет интегрирован видеоплеер для воспроизведения загруженных выступлений")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Видео")
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
    VideoArchiveView()
}
