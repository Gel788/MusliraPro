//
//  ArtistsView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct ArtistsView: View {
    @State private var artists: [Artist] = []
    @State private var selectedArtist: Artist?
    @State private var searchText = ""
    @State private var selectedGenre: ArtistGenre?
    
    var filteredArtists: [Artist] {
        var filtered = artists
        
        if let genre = selectedGenre {
            filtered = filtered.filter { $0.genre == genre.rawValue }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { artist in
                artist.name.localizedCaseInsensitiveContains(searchText) ||
                artist.genre.localizedCaseInsensitiveContains(searchText) ||
                artist.bio.localizedCaseInsensitiveContains(searchText)
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
                    if artists.isEmpty {
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
                                
                                Image(systemName: "music.note.house.fill")
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
                                Text("🎵 Артисты скоро появятся!")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("✨ Следите за обновлениями, чтобы не пропустить новых исполнителей")
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
                                ForEach(filteredArtists) { artist in
                                    PremiumArtistCard(artist: artist) {
                                        selectedArtist = artist
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .navigationTitle("🎵 Артисты")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "🔍 Поиск артистов...")
            .onAppear {
                loadSampleArtists()
            }
            .sheet(item: $selectedArtist) { artist in
                ArtistDetailView(artist: artist)
            }
        }
    }
    
    private func loadSampleArtists() {
        // Крутые моковые данные для артистов с уникальными номерами
        artists = [
            Artist(
                artistNumber: 1,
                name: "DJ Муз Лира",
                genre: "electronic",
                bio: "Электронный музыкант с 10-летним опытом. Специализируется на прогрессивном хаусе и техно. Участник крупнейших фестивалей России.",
                followers: 15420,
                isVerified: true
            ),
            Artist(
                artistNumber: 2,
                name: "Группа 'Мелодия'",
                genre: "rock",
                bio: "Рок-группа из Москвы, основанная в 2018 году. Играют в стиле альтернативного рока с элементами инди-музыки.",
                followers: 8930,
                isVerified: true
            ),
            Artist(
                artistNumber: 3,
                name: "Producer Pro",
                genre: "hip_hop",
                bio: "Хип-хоп продюсер и битмейкер. Работал с известными рэперами. Специализируется на создании битов в стиле trap и drill.",
                followers: 25670,
                isVerified: true
            ),
            Artist(
                artistNumber: 4,
                name: "Jazz Collective",
                genre: "jazz",
                bio: "Джазовый коллектив, исполняющий классический и современный джаз. Регулярные выступления в московских клубах.",
                followers: 5670,
                isVerified: false
            ),
            Artist(
                artistNumber: 5,
                name: "Classical Symphony",
                genre: "classical",
                bio: "Симфонический оркестр, специализирующийся на классической музыке. Выступления в концертных залах и на фестивалях.",
                followers: 12450,
                isVerified: true
            ),
            Artist(
                artistNumber: 6,
                name: "Folk Ensemble",
                genre: "folk",
                bio: "Фолк-ансамбль, исполняющий народную музыку разных стран. Используют традиционные инструменты и современные аранжировки.",
                followers: 3450,
                isVerified: false
            ),
            Artist(
                artistNumber: 7,
                name: "Metal Masters",
                genre: "metal",
                bio: "Метал-группа, играющая в стиле прогрессивного металла. Известны своими сложными композициями и мощными выступлениями.",
                followers: 18920,
                isVerified: true
            ),
            Artist(
                artistNumber: 8,
                name: "Pop Star",
                genre: "pop",
                bio: "Поп-исполнительница с ярким вокалом и запоминающимися мелодиями. Участница музыкальных конкурсов и телешоу.",
                followers: 45670,
                isVerified: true
            )
        ]
        
        // Добавляем красивые изображения для артистов
        artists[0].avatarURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=400&fit=crop"
        artists[0].coverImageURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=400&fit=crop"
        artists[0].upcomingEvents = 3
        artists[0].totalViews = 125000
        
        artists[1].avatarURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=400&fit=crop"
        artists[1].coverImageURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=800&h=400&fit=crop"
        artists[1].upcomingEvents = 2
        artists[1].totalViews = 89000
        
        artists[2].avatarURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=400&fit=crop"
        artists[2].coverImageURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=800&h=400&fit=crop"
        artists[2].upcomingEvents = 1
        artists[2].totalViews = 200000
        
        artists[3].avatarURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=400&fit=crop"
        artists[3].coverImageURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800&h=400&fit=crop"
        artists[3].upcomingEvents = 4
        artists[3].totalViews = 45000
        
        artists[4].avatarURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=400&fit=crop"
        artists[4].coverImageURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=400&fit=crop"
        artists[4].upcomingEvents = 2
        artists[4].totalViews = 180000
        
        artists[5].avatarURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=400&fit=crop"
        artists[5].coverImageURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=800&h=400&fit=crop"
        artists[5].upcomingEvents = 1
        artists[5].totalViews = 25000
        
        artists[6].avatarURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=400&fit=crop"
        artists[6].coverImageURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=800&h=400&fit=crop"
        artists[6].upcomingEvents = 3
        artists[6].totalViews = 150000
        
        artists[7].avatarURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=400&fit=crop"
        artists[7].coverImageURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800&h=400&fit=crop"
        artists[7].upcomingEvents = 5
        artists[7].totalViews = 300000
        
        // Добавляем социальные ссылки
        for i in 0..<artists.count {
            artists[i].socialLinks = [
                SocialLink(platform: "Instagram", url: "https://instagram.com/artist\(i)", icon: "camera.fill"),
                SocialLink(platform: "YouTube", url: "https://youtube.com/artist\(i)", icon: "play.rectangle.fill"),
                SocialLink(platform: "Spotify", url: "https://spotify.com/artist\(i)", icon: "music.note")
            ]
        }
    }
}

struct PremiumArtistCard: View {
    let artist: Artist
    let onTap: () -> Void
    @State private var isPressed = false
    @State private var isHovered = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                // Современная карточка с минималистичным дизайном
                ZStack {
                    // Основной контейнер
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                    
                    VStack(spacing: 0) {
                        // Изображение артиста
                        ZStack {
                            AsyncImage(url: URL(string: artist.coverImageURL ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.red.opacity(0.8),
                                                Color.orange.opacity(0.6)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                            .frame(height: 160)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 16,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 16
                                )
                            )
                            
                            // Градиентный оверлей
                            UnevenRoundedRectangle(
                                topLeadingRadius: 16,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 16
                            )
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.clear,
                                        Color.black.opacity(0.3)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(height: 160)
                    
                            // Минималистичные бейджи
                            VStack {
                                HStack {
                                    // Номер артиста
                                    Text("#\(artist.artistNumber)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.black.opacity(0.6))
                                        )
                                    
                                    Spacer()
                                    
                                    // Жанр
                                    Text(artist.genre.capitalized)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.black.opacity(0.6))
                                        )
                                }
                                .padding(.horizontal, 12)
                                .padding(.top, 12)
                                
                                Spacer()
                                
                                // Имя артиста
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(artist.name)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                    
                                    if artist.isVerified {
                                        HStack(spacing: 4) {
                                            Image(systemName: "checkmark.seal.fill")
                                                .font(.caption2)
                                                .foregroundColor(.blue)
                                            Text("Verified")
                                                .font(.caption2)
                                                .fontWeight(.medium)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 12)
                            }
                        }
                        
                        // Информационная панель
                        VStack(alignment: .leading, spacing: 16) {
                            // Описание
                            Text(artist.bio)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            
                            // Статистика
                            HStack(spacing: 16) {
                                HStack(spacing: 6) {
                                    Image(systemName: "person.2.fill")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                    Text("\(artist.followers)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 6) {
                                    Image(systemName: "calendar")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                    Text("\(artist.upcomingEvents) событий")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(20)
                        .background(Color(.systemGray6))
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

struct ArtistDetailView: View {
    let artist: Artist
    @Environment(\.dismiss) private var dismiss
    @State private var showingCollaborationForm = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Красивое изображение артиста
                    ZStack {
                        AsyncImage(url: URL(string: artist.coverImageURL ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.red.opacity(0.8), Color.orange.opacity(0.6)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .frame(height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        // Градиентный оверлей
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0.7)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(height: 280)
                        
                        VStack {
                            HStack {
                                Spacer()
                                // Жанр музыки
                                Text(artist.genre.capitalized)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.red.opacity(0.8))
                                    )
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            
                            Spacer()
                            
                            VStack(spacing: 12) {
                                Text(artist.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                
                                if artist.isVerified {
                                    HStack(spacing: 8) {
                                        Image(systemName: "checkmark.seal.fill")
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                        Text("Проверенный артист")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black.opacity(0.4))
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(artist.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(artist.bio)
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.red)
                            Text("\(artist.followers) подписчиков")
                                .font(.headline)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.orange)
                            Text("\(artist.upcomingEvents) предстоящих событий")
                                .font(.headline)
                        }
                        
                        HStack {
                            Image(systemName: "eye.fill")
                                .foregroundColor(.blue)
                            Text("\(artist.totalViews) просмотров")
                                .font(.headline)
                        }
                        
                        if !artist.socialLinks.isEmpty {
                            Text("Социальные сети:")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 12) {
                                ForEach(artist.socialLinks) { link in
                                    SocialLinkCard(link: link)
                                }
                            }
                        }
                        
                        // Кнопка сотрудничества
                        Button(action: {
                            showingCollaborationForm = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "handshake.fill")
                                    .font(.title3)
                                
                                Text("Подать заявку на сотрудничество")
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
                        .padding(.top, 20)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Артист")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingCollaborationForm) {
            CollaborationFormView(artist: artist)
        }
    }
}

struct SocialLinkCard: View {
    let link: SocialLink
    
    var body: some View {
        Button(action: {
            if let url = URL(string: link.url) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: link.icon)
                    .font(.caption)
                    .foregroundColor(.white)
                
                Text(link.platform)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
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

#Preview {
    ArtistsView()
}
