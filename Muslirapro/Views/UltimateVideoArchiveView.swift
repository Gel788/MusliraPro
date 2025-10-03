//
//  UltimateVideoArchiveView.swift
//  Muslirapro
//
//  World-Class Video Archive
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UltimateVideoArchiveView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    @State private var selectedVideo: VideoArchiveItem?
    @State private var showFilters = false
    
    let categories = ["All", "Concerts", "Masterclass", "Interviews", "Behind Scenes"]
    
    let videos = [
        VideoArchiveItem(
            title: "Electronic Symphony Live",
            artist: "DJ Muslira",
            thumbnail: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800&h=600&fit=crop",
            duration: "2:45:30",
            views: 15420,
            date: "Dec 10, 2024",
            category: "Concerts"
        ),
        VideoArchiveItem(
            title: "Vocal Techniques Masterclass",
            artist: "Maria Johnson",
            thumbnail: "https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=800&h=600&fit=crop",
            duration: "1:30:15",
            views: 8932,
            date: "Dec 8, 2024",
            category: "Masterclass"
        ),
        VideoArchiveItem(
            title: "Interview with Rock Legends",
            artist: "The Warriors",
            thumbnail: "https://images.unsplash.com/photo-1501612780327-45045538702b?w=800&h=600&fit=crop",
            duration: "45:20",
            views: 12450,
            date: "Dec 5, 2024",
            category: "Interviews"
        ),
        VideoArchiveItem(
            title: "Studio Recording Session",
            artist: "Beat Masters",
            thumbnail: "https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=800&h=600&fit=crop",
            duration: "3:15:45",
            views: 6789,
            date: "Dec 1, 2024",
            category: "Behind Scenes"
        )
    ]
    
    var filteredVideos: [VideoArchiveItem] {
        var result = videos
        
        if selectedCategory != "All" {
            result = result.filter { $0.category == selectedCategory }
        }
        
        if !searchText.isEmpty {
            result = result.filter { video in
                video.title.localizedCaseInsensitiveContains(searchText) ||
                video.artist.localizedCaseInsensitiveContains(searchText)
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
                    
                    // Category Pills
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                CategoryPill(
                                    title: category,
                                    isSelected: selectedCategory == category
                                ) {
                                    selectedCategory = category
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.vertical, 16)
                    
                    // Videos Grid
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(filteredVideos) { video in
                                VideoCard(video: video) {
                                    selectedVideo = video
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Video Archive")
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
            .sheet(item: $selectedVideo) { video in
                VideoPlayerView(video: video)
            }
            .sheet(isPresented: $showFilters) {
                VideoFiltersView()
            }
        }
    }
}

// MARK: - Models
struct VideoArchiveItem: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let thumbnail: String
    let duration: String
    let views: Int
    let date: String
    let category: String
}

// MARK: - Video Card
struct VideoCard: View {
    let video: VideoArchiveItem
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 0) {
                // Thumbnail
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: video.thumbnail)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(Color(white: 0.15))
                    }
                    .aspectRatio(16/9, contentMode: .fill)
                    
                    // Duration badge
                    Text(video.duration)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.8))
                        )
                        .padding(8)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
                // Info
                VStack(alignment: .leading, spacing: 6) {
                    Text(video.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    Text(video.artist)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.6))
                        .lineLimit(1)
                    
                    HStack(spacing: 8) {
                        HStack(spacing: 4) {
                            Image(systemName: "eye.fill")
                                .font(.system(size: 10))
                            Text("\(formatNumber(video.views))")
                                .font(.system(size: 11))
                        }
                        
                        Text("•")
                        
                        Text(video.date)
                            .font(.system(size: 11))
                    }
                    .foregroundColor(.white.opacity(0.5))
                }
                .padding(.top, 8)
            }
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

// MARK: - Video Player View
struct VideoPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    let video: VideoArchiveItem
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Video Player
                    Rectangle()
                        .fill(Color(white: 0.1))
                        .aspectRatio(16/9, contentMode: .fit)
                        .overlay(
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 64))
                                .foregroundColor(.white.opacity(0.8))
                        )
                    
                    // Info Section
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(video.title)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Text(video.artist)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            
                            HStack(spacing: 20) {
                                HStack(spacing: 6) {
                                    Image(systemName: "eye.fill")
                                        .font(.system(size: 14))
                                    Text("\(video.views) views")
                                        .font(.system(size: 14))
                                }
                                
                                HStack(spacing: 6) {
                                    Image(systemName: "calendar")
                                        .font(.system(size: 14))
                                    Text(video.date)
                                        .font(.system(size: 14))
                                }
                            }
                            .foregroundColor(.white.opacity(0.6))
                            
                            Divider()
                                .background(Color.white.opacity(0.1))
                            
                            Text("Category: \(video.category)")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding(24)
                    }
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
                    HStack(spacing: 16) {
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Video Filters View
struct VideoFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedQuality = "All"
    @State private var selectedDuration = "All"
    @State private var selectedSort = "Recent"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        FilterSection(title: "Quality") {
                            FilterPills(options: ["All", "HD", "4K"], selected: $selectedQuality)
                        }
                        
                        FilterSection(title: "Duration") {
                            FilterPills(options: ["All", "< 30min", "30-60min", "> 60min"], selected: $selectedDuration)
                        }
                        
                        FilterSection(title: "Sort By") {
                            FilterPills(options: ["Recent", "Popular", "Most Viewed"], selected: $selectedSort)
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
    UltimateVideoArchiveView()
}

