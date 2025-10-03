//
//  UltimateArtistsView.swift
//  Muslirapro
//
//  World-Class Artists View
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UltimateArtistsView: View {
    @State private var searchText = ""
    @State private var selectedGenre = "All"
    @State private var selectedArtist: ArtistMock?
    @State private var showFilters = false
    
    let genres = ["All", "Electronic", "Rock", "Pop", "Jazz", "Classical", "Hip-Hop"]
    
    let artists = [
        ArtistMock(
            name: "Elena Volkova",
            genre: "Classical",
            bio: "Award-winning pianist and composer",
            followers: 125000,
            isVerified: true,
            rating: 4.9,
            concertsCount: 45,
            imageURL: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop"
        ),
        ArtistMock(
            name: "DJ Muslira",
            genre: "Electronic",
            bio: "Electronic music producer & DJ",
            followers: 89000,
            isVerified: true,
            rating: 4.8,
            concertsCount: 67,
            imageURL: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop"
        ),
        ArtistMock(
            name: "The Warriors",
            genre: "Rock",
            bio: "Legendary rock band since 2010",
            followers: 234000,
            isVerified: true,
            rating: 4.9,
            concertsCount: 102,
            imageURL: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=400&fit=crop"
        ),
        ArtistMock(
            name: "Maria Johnson",
            genre: "Pop",
            bio: "Pop sensation & vocal coach",
            followers: 156000,
            isVerified: true,
            rating: 4.7,
            concertsCount: 38,
            imageURL: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=400&fit=crop"
        ),
        ArtistMock(
            name: "Alex Storm",
            genre: "Hip-Hop",
            bio: "Hip-hop artist & producer",
            followers: 78000,
            isVerified: true,
            rating: 4.6,
            concertsCount: 29,
            imageURL: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=400&fit=crop"
        ),
        ArtistMock(
            name: "Sarah Blues",
            genre: "Jazz",
            bio: "Jazz vocalist extraordinaire",
            followers: 92000,
            isVerified: true,
            rating: 4.8,
            concertsCount: 54,
            imageURL: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400&h=400&fit=crop"
        )
    ]
    
    var filteredArtists: [ArtistMock] {
        var result = artists
        
        if selectedGenre != "All" {
            result = result.filter { $0.genre == selectedGenre }
        }
        
        if !searchText.isEmpty {
            result = result.filter { artist in
                artist.name.localizedCaseInsensitiveContains(searchText) ||
                artist.genre.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return result
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Search Bar
                    SearchBar(text: $searchText)
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                    
                    // Genre Pills
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(genres, id: \.self) { genre in
                                CategoryPill(
                                    title: genre,
                                    isSelected: selectedGenre == genre
                                ) {
                                    selectedGenre = genre
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.vertical, 16)
                    
                    // Artists List
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(filteredArtists) { artist in
                                ArtistCard(artist: artist) {
                                    selectedArtist = artist
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Artists")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showFilters = true }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(item: $selectedArtist) { artist in
                ArtistDetailView(artist: artist)
            }
            .sheet(isPresented: $showFilters) {
                ArtistFiltersView()
            }
        }
    }
}

// MARK: - Models
struct ArtistMock: Identifiable {
    let id = UUID()
    let name: String
    let genre: String
    let bio: String
    let followers: Int
    let isVerified: Bool
    let rating: Double
    let concertsCount: Int
    let imageURL: String
}

// MARK: - Artist Card
struct ArtistCard: View {
    let artist: ArtistMock
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Avatar
                AsyncImage(url: URL(string: artist.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color(white: 0.15))
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
                
                // Info
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Text(artist.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        if artist.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Text(artist.genre)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 11))
                            Text(formatNumber(artist.followers))
                                .font(.system(size: 12))
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 11))
                            Text(String(format: "%.1f", artist.rating))
                                .font(.system(size: 12))
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "music.note")
                                .font(.system(size: 11))
                            Text("\(artist.concertsCount)")
                                .font(.system(size: 12))
                        }
                    }
                    .foregroundColor(.white.opacity(0.5))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private func formatNumber(_ number: Int) -> String {
        if number >= 1000 {
            return String(format: "%.1fK", Double(number) / 1000)
        }
        return "\(number)"
    }
}

// MARK: - Artist Detail View
struct ArtistDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let artist: ArtistMock
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        // Header with Image
                        VStack(spacing: 20) {
                            AsyncImage(url: URL(string: artist.imageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color(white: 0.15))
                            }
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.1), lineWidth: 2)
                            )
                            
                            VStack(spacing: 12) {
                                HStack(spacing: 8) {
                                    Text(artist.name)
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    if artist.isVerified {
                                        Image(systemName: "checkmark.seal.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.blue)
                                    }
                                }
                                
                                Text(artist.genre)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white.opacity(0.6))
                                
                                Text(artist.bio)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.5))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                            }
                        }
                        
                        // Stats Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ArtistStatCard(icon: "person.2.fill", value: formatNumber(artist.followers), label: "Followers")
                            ArtistStatCard(icon: "star.fill", value: String(format: "%.1f", artist.rating), label: "Rating")
                            ArtistStatCard(icon: "music.note", value: "\(artist.concertsCount)", label: "Concerts")
                        }
                        
                        // Action Buttons
                        VStack(spacing: 12) {
                            Button(action: {}) {
                                Text("Follow")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        Capsule()
                                            .fill(Color.white)
                                    )
                            }
                            
                            HStack(spacing: 12) {
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "play.circle.fill")
                                        Text("Play")
                                    }
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.1))
                                    )
                                }
                                
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "message.fill")
                                        Text("Message")
                                    }
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.1))
                                    )
                                }
                            }
                        }
                    }
                    .padding(24)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    private func formatNumber(_ number: Int) -> String {
        if number >= 1000 {
            return String(format: "%.1fK", Double(number) / 1000)
        }
        return "\(number)"
    }
}

struct ArtistStatCard: View {
    let icon: String
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white.opacity(0.6))
            
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
    }
}

// MARK: - Artist Filters View
struct ArtistFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedRating = "All"
    @State private var selectedVerified = "All"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        FilterSection(title: "Verification") {
                            FilterPills(options: ["All", "Verified", "Unverified"], selected: $selectedVerified)
                        }
                        
                        FilterSection(title: "Rating") {
                            FilterPills(options: ["All", "5 Stars", "4+ Stars", "3+ Stars"], selected: $selectedRating)
                        }
                        
                        Button(action: { dismiss() }) {
                            Text("Apply Filters")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    Capsule()
                                        .fill(Color.white)
                                )
                        }
                    }
                    .padding(24)
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    UltimateArtistsView()
}

