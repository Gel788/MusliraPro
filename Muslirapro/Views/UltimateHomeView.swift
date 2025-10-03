//
//  UltimateHomeView.swift
//  Muslirapro
//
//  World-Class Platform with Full Features
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UltimateHomeView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var showLogin = false
    @State private var selectedTab: HomeTab = .main
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Navigation
                TopNavigationBar(showLogin: $showLogin)
                    .padding(.horizontal, 24)
                    .padding(.top, 50)
                
                // Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Hero Section
                        HeroSection()
                            .padding(.top, 32)
                        
                        // Quick Access
                        QuickAccessSection()
                            .padding(.top, 48)
                        
                        // Main Sections
                        MainSectionsGrid()
                            .padding(.top, 48)
                        
                        // Live Stream
                        LiveStreamSection()
                            .padding(.top, 56)
                        
                        Spacer(minLength: 80)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showLogin) {
            PremiumLoginView()
        }
    }
}

// MARK: - Top Navigation Bar
struct TopNavigationBar: View {
    @Binding var showLogin: Bool
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        HStack(alignment: .center) {
            // Logo
            HStack(spacing: 10) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                
                Text("MUSLIRA")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Auth Buttons
            if !authManager.isAuthenticated {
                HStack(spacing: 12) {
                    Button(action: { showLogin = true }) {
                        Text("Sign In")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Button(action: { showLogin = true }) {
                        Text("Start")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                            )
                    }
                }
            } else {
                Button(action: {}) {
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: 36, height: 36)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        )
                }
            }
        }
    }
}

// MARK: - Hero Section
struct HeroSection: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Your Gateway to")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
                .tracking(2)
            
            Text("Muslira Pro")
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text("Live concerts, masterclasses, and exclusive content\nfrom world-class artists")
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.6))
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, 32)
        }
        .padding(.horizontal, 24)
    }
}

// MARK: - Quick Access Section
struct QuickAccessSection: View {
    @State private var showSubscription = false
    @State private var showArtists = false
    @State private var showPartners = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Quick Access")
                    .font(.system(size: 12, weight: .bold))
                    .tracking(1.5)
                    .foregroundColor(.white.opacity(0.5))
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            HStack(spacing: 12) {
                QuickAccessButton(
                    icon: "bell.fill",
                    title: "Subscribe",
                    action: { showSubscription = true }
                )
                
                QuickAccessButton(
                    icon: "mic.fill",
                    title: "Artists",
                    action: { showArtists = true }
                )
                
                QuickAccessButton(
                    icon: "star.fill",
                    title: "Partners",
                    action: { showPartners = true }
                )
            }
            .padding(.horizontal, 24)
        }
        .sheet(isPresented: $showSubscription) {
            PremiumSubscriptionView()
        }
        .sheet(isPresented: $showArtists) {
            UltimateArtistsView()
        }
        .sheet(isPresented: $showPartners) {
            PartnersSelectionView()
        }
    }
}

struct QuickAccessButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: 56, height: 56)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - Main Sections Grid
struct MainSectionsGrid: View {
    @State private var selectedSection: MainSection?
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Explore")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 12),
                GridItem(.flexible(), spacing: 12)
            ], spacing: 12) {
                MainSectionCard(
                    icon: "ticket.fill",
                    title: "Concerts",
                    subtitle: "Live events",
                    gradient: [Color(red: 0.8, green: 0.2, blue: 0.3), Color(red: 0.6, green: 0.1, blue: 0.4)]
                ) {
                    selectedSection = .concerts
                }
                
                MainSectionCard(
                    icon: "graduationcap.fill",
                    title: "Courses",
                    subtitle: "Learn & grow",
                    gradient: [Color(red: 0.2, green: 0.5, blue: 0.8), Color(red: 0.1, green: 0.3, blue: 0.6)]
                ) {
                    selectedSection = .courses
                }
                
                MainSectionCard(
                    icon: "message.fill",
                    title: "Chat",
                    subtitle: "Connect",
                    gradient: [Color(red: 0.3, green: 0.7, blue: 0.4), Color(red: 0.2, green: 0.5, blue: 0.3)]
                ) {
                    selectedSection = .chat
                }
                
                MainSectionCard(
                    icon: "chart.bar.fill",
                    title: "Rating",
                    subtitle: "Top artists",
                    gradient: [Color(red: 0.9, green: 0.6, blue: 0.2), Color(red: 0.7, green: 0.4, blue: 0.1)]
                ) {
                    selectedSection = .rating
                }
                
                MainSectionCard(
                    icon: "sparkles",
                    title: "Festival",
                    subtitle: "Special events",
                    gradient: [Color(red: 0.7, green: 0.3, blue: 0.8), Color(red: 0.5, green: 0.2, blue: 0.6)],
                    isWide: true
                ) {
                    selectedSection = .festival
                }
            }
            .padding(.horizontal, 24)
        }
        .sheet(item: $selectedSection) { section in
            SectionDetailView(section: section)
        }
    }
}

enum MainSection: Identifiable {
    case concerts, courses, chat, rating, festival
    
    var id: String {
        switch self {
        case .concerts: return "concerts"
        case .courses: return "courses"
        case .chat: return "chat"
        case .rating: return "rating"
        case .festival: return "festival"
        }
    }
    
    var title: String {
        switch self {
        case .concerts: return "Concerts"
        case .courses: return "Courses"
        case .chat: return "Chat"
        case .rating: return "Artists Rating"
        case .festival: return "Festival"
        }
    }
}

struct MainSectionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    var isWide: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .if(isWide) { view in
            view.gridCellColumns(2)
        }
    }
}

// MARK: - Live Stream Section
struct LiveStreamSection: View {
    @State private var showLiveStream = false
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    
                    Text("LIVE NOW")
                        .font(.system(size: 12, weight: .bold))
                        .tracking(1.5)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            Button(action: { showLiveStream = true }) {
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(Color(white: 0.12))
                        .aspectRatio(16/9, contentMode: .fill)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.clear,
                                    Color.black.opacity(0.6)
                                ]),
                                startPoint: .center,
                                endPoint: .bottom
                            )
                        )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Electronic Symphony")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack {
                            Text("DJ Muslira")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Spacer()
                            
                            HStack(spacing: 6) {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 11))
                                Text("2.8K")
                                    .font(.system(size: 13, weight: .medium))
                            }
                            .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    .padding(20)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
            }
            .buttonStyle(ScaleButtonStyle())
            .padding(.horizontal, 24)
        }
        .fullScreenCover(isPresented: $showLiveStream) {
            PremiumLiveStreamView()
        }
    }
}

// MARK: - Section Detail View
struct SectionDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let section: MainSection
    @State private var showFilters = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Content based on section
                        switch section {
                        case .concerts:
                            ConcertsContent(showFilters: $showFilters)
                        case .courses:
                            CoursesContent(showFilters: $showFilters)
                        case .chat:
                            ChatContent()
                        case .rating:
                            RatingContent()
                        case .festival:
                            FestivalContent()
                        }
                    }
                    .padding(24)
                }
            }
            .navigationTitle(section.title)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                if section == .concerts || section == .courses {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showFilters = true }) {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                if section == .concerts {
                    ConcertFiltersView()
                } else if section == .courses {
                    CourseFiltersView()
                }
            }
        }
    }
}

// MARK: - Concerts Content
struct ConcertsContent: View {
    @Binding var showFilters: Bool
    
    let concerts = [
        ConcertItem(title: "Jazz Night", artist: "John Smith Quartet", date: "Dec 15, 2025", location: "Moscow", price: "2500₽", isOnline: false, imageURL: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800&h=600&fit=crop"),
        ConcertItem(title: "Rock Legends", artist: "The Warriors", date: "Dec 20, 2025", location: "St. Petersburg", price: "3500₽", isOnline: false, imageURL: "https://images.unsplash.com/photo-1501612780327-45045538702b?w=800&h=600&fit=crop"),
        ConcertItem(title: "Electronic Dreams", artist: "DJ Muslira", date: "Dec 25, 2025", location: "Online", price: "1500₽", isOnline: true, imageURL: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800&h=600&fit=crop")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(concerts) { concert in
                ConcertCard(concert: concert)
            }
        }
    }
}

struct ConcertItem: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let date: String
    let location: String
    let price: String
    let isOnline: Bool
    let imageURL: String
}

struct ConcertCard: View {
    let concert: ConcertItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image
            AsyncImage(url: URL(string: concert.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color(white: 0.15))
            }
            .frame(height: 180)
            .clipped()
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(concert.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(concert.artist)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    if concert.isOnline {
                        Text("ONLINE")
                            .font(.system(size: 10, weight: .bold))
                            .tracking(1)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.green.opacity(0.2))
                            )
                    }
                }
                
                HStack(spacing: 16) {
                    HStack(spacing: 6) {
                        Image(systemName: "calendar")
                            .font(.system(size: 12))
                        Text(concert.date)
                            .font(.system(size: 13))
                    }
                    
                    HStack(spacing: 6) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 12))
                        Text(concert.location)
                            .font(.system(size: 13))
                    }
                    
                    Spacer()
                    
                    Text(concert.price)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                .foregroundColor(.white.opacity(0.6))
                
                Button(action: {}) {
                    Text("Buy Ticket")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                }
            }
            .padding(20)
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Courses Content
struct CoursesContent: View {
    @Binding var showFilters: Bool
    
    let courses = [
        CourseItem(title: "Vocal Mastery", instructor: "Maria Johnson", duration: "8 weeks", level: "Intermediate", price: "15,000₽", format: "Video", imageURL: "https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=800&h=600&fit=crop"),
        CourseItem(title: "Guitar Basics", instructor: "Alex Rock", duration: "6 weeks", level: "Beginner", price: "10,000₽", format: "Live", imageURL: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=800&h=600&fit=crop"),
        CourseItem(title: "Music Production", instructor: "Beat Masters", duration: "12 weeks", level: "Advanced", price: "25,000₽", format: "Video", imageURL: "https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=800&h=600&fit=crop")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(courses) { course in
                CourseCard(course: course)
            }
        }
    }
}

struct CourseItem: Identifiable {
    let id = UUID()
    let title: String
    let instructor: String
    let duration: String
    let level: String
    let price: String
    let format: String
    let imageURL: String
}

struct CourseCard: View {
    let course: CourseItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image
            AsyncImage(url: URL(string: course.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color(white: 0.15))
            }
            .frame(height: 180)
            .clipped()
            
            VStack(alignment: .leading, spacing: 16) {
                Text(course.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                HStack {
                    Text(course.instructor)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Spacer()
                    
                    Text(course.level)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.1))
                        )
                }
                
                HStack(spacing: 16) {
                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                            .font(.system(size: 12))
                        Text(course.duration)
                            .font(.system(size: 13))
                    }
                    
                    HStack(spacing: 6) {
                        Image(systemName: course.format == "Live" ? "video.fill" : "play.rectangle.fill")
                            .font(.system(size: 12))
                        Text(course.format)
                            .font(.system(size: 13))
                    }
                    
                    Spacer()
                    
                    Text(course.price)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                .foregroundColor(.white.opacity(0.6))
                
                Button(action: {}) {
                    Text("Enroll Now")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                }
            }
            .padding(20)
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Chat Content
struct ChatContent: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Chat feature coming soon")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.6))
        }
        .frame(maxHeight: .infinity)
    }
}

// MARK: - Rating Content
struct RatingContent: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(1...5, id: \.self) { index in
                HStack {
                    Text("#\(index)")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white.opacity(0.5))
                        .frame(width: 40)
                    
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Artist Name")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("Genre")
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.orange)
                            Text("4.9")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        Text("1.2K votes")
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.white.opacity(0.03))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(Color.white.opacity(0.08), lineWidth: 1)
                        )
                )
            }
        }
    }
}

// MARK: - Festival Content
struct FestivalContent: View {
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.5, green: 0.2, blue: 0.8),
                                Color(red: 0.3, green: 0.1, blue: 0.5)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 200)
                
                VStack(spacing: 12) {
                    Text("MUSIC FESTIVAL 2025")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("December 20-22, 2025")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Button(action: {}) {
                        Text("Get Tickets")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                            )
                    }
                    .padding(.top, 8)
                }
            }
        }
    }
}

// MARK: - Concert Filters View
struct ConcertFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCity = "All"
    @State private var selectedGenre = "All"
    @State private var dateFrom = Date()
    @State private var dateTo = Date()
    @State private var priceRange = 0...10000
    @State private var format = "All"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        FilterSection(title: "City") {
                            FilterPills(options: ["All", "Moscow", "St. Petersburg", "Kazan"], selected: $selectedCity)
                        }
                        
                        FilterSection(title: "Genre") {
                            FilterPills(options: ["All", "Rock", "Pop", "Jazz", "Classical"], selected: $selectedGenre)
                        }
                        
                        FilterSection(title: "Format") {
                            FilterPills(options: ["All", "Online", "Offline"], selected: $format)
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

// MARK: - Course Filters View
struct CourseFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTopic = "All"
    @State private var selectedLevel = "All"
    @State private var selectedFormat = "All"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        FilterSection(title: "Topic") {
                            FilterPills(options: ["All", "Vocal", "Guitar", "Piano", "Production"], selected: $selectedTopic)
                        }
                        
                        FilterSection(title: "Level") {
                            FilterPills(options: ["All", "Beginner", "Intermediate", "Advanced"], selected: $selectedLevel)
                        }
                        
                        FilterSection(title: "Format") {
                            FilterPills(options: ["All", "Video", "Live Sessions"], selected: $selectedFormat)
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

// MARK: - Partners Selection View
struct PartnersSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        PartnerTypeCard(
                            icon: "megaphone.fill",
                            title: "With Advertising",
                            description: "Get instant access, manager will contact you",
                            color: Color.orange
                        )
                        
                        PartnerTypeCard(
                            icon: "crown.fill",
                            title: "Premium Partner",
                            description: "Ad-free experience, full access",
                            color: Color.purple
                        )
                        
                        PartnerTypeCard(
                            icon: "briefcase.fill",
                            title: "Agent / Manager",
                            description: "Professional tools and analytics",
                            color: Color.blue
                        )
                    }
                    .padding(24)
                }
            }
            .navigationTitle("Choose Partner Type")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
            }
        }
    }
}

struct PartnerTypeCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.2))
                        .frame(width: 56, height: 56)
                    
                    Image(systemName: icon)
                        .font(.system(size: 24))
                        .foregroundColor(color)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - View Extension
extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

enum HomeTab {
    case main, concerts, courses, chat, rating, festival
}

#Preview {
    UltimateHomeView()
        .environmentObject(AuthenticationManager())
}

