//
//  PartnersView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct PartnersView: View {
    @State private var searchText = ""
    @State private var selectedCategory: PartnerCategory? = nil
    
    let partners = [
        Partner(
            name: "Sony Music",
            description: "Ведущий лейбл звукозаписи",
            category: .music,
            websiteURL: "https://sonymusic.com"
        ),
        Partner(
            name: "Spotify",
            description: "Музыкальная платформа",
            category: .media,
            websiteURL: "https://spotify.com"
        ),
        Partner(
            name: "Apple Music",
            description: "Стриминговая платформа",
            category: .media,
            websiteURL: "https://music.apple.com"
        ),
        Partner(
            name: "Universal Music",
            description: "Крупнейший лейбл",
            category: .music,
            websiteURL: "https://universalmusic.com"
        ),
        Partner(
            name: "YouTube Music",
            description: "Видео и аудио платформа",
            category: .media,
            websiteURL: "https://music.youtube.com"
        ),
        Partner(
            name: "SoundCloud",
            description: "Платформа для музыкантов",
            category: .media,
            websiteURL: "https://soundcloud.com"
        )
    ]
    
    var filteredPartners: [Partner] {
        var filtered = partners
        
        if !searchText.isEmpty {
            filtered = filtered.filter { partner in
                partner.name.localizedCaseInsensitiveContains(searchText) ||
                partner.description.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        return filtered
    }
    
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
                    VStack(spacing: 24) {
                        // Элитный хедер
                        VStack(spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text("🤝")
                                            .font(.title2)
                                        Text("Наши партнеры")
                                            .font(.title2)
                                            .fontWeight(.black)
                                            .foregroundStyle(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.white, .purple.opacity(0.8)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                    }
                                    
                                    Text("Ведущие компании музыкальной индустрии")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                Spacer()
                                
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
                                        
                                        Image(systemName: "info.circle.fill")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                    }
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
                            .padding(.horizontal)
                        }
                        
                        // Премиальная поисковая строка
                        VStack(spacing: 16) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.title3)
                                
                                TextField("Поиск партнеров...", text: $searchText)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.white.opacity(0.2),
                                                    Color.white.opacity(0.1)
                                                ]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                    
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                }
                            )
                            .padding(.horizontal)
                            
                            // Элитные фильтры
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    PremiumFilterButton(
                                        title: "Все",
                                        icon: "star.fill",
                                        isSelected: selectedCategory == nil,
                                        gradient: [.purple, .blue]
                                    ) {
                                        selectedCategory = nil
                                    }
                                    
                                    ForEach(PartnerCategory.allCases, id: \.self) { category in
                                        PremiumFilterButton(
                                            title: category.displayName,
                                            icon: iconForCategory(category),
                                            isSelected: selectedCategory == category,
                                            gradient: [colorForCategory(category), colorForCategory(category).opacity(0.7)]
                                        ) {
                                            selectedCategory = category
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Премиальные карточки партнеров
                        if filteredPartners.isEmpty {
                            PremiumEmptyState(
                                icon: "person.2.slash",
                                title: "Партнеры не найдены",
                                subtitle: "Попробуйте изменить поисковый запрос или фильтр"
                            )
                        } else {
                            LazyVStack(spacing: 16) {
                                ForEach(filteredPartners) { partner in
                                    PremiumPartnerCard(partner: partner)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Партнеры")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func iconForCategory(_ category: PartnerCategory) -> String {
        switch category {
        case .music: return "music.note"
        case .equipment: return "headphones"
        case .venue: return "building.2"
        case .media: return "play.circle"
        case .other: return "globe"
        }
    }
    
    func colorForCategory(_ category: PartnerCategory) -> Color {
        switch category {
        case .music: return .purple
        case .equipment: return .orange
        case .venue: return .red
        case .media: return .blue
        case .other: return .green
        }
    }
}

struct PremiumFilterButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let gradient: [Color]
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white : .primary)
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(isSelected ? .white : .primary)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            isSelected ?
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .leading,
                                endPoint: .trailing
                            ) :
                            LinearGradient(
                                gradient: Gradient(colors: [Color(.systemGray6), Color(.systemGray5)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    if isSelected {
                        RoundedRectangle(cornerRadius: 20)
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
                }
            )
            .shadow(color: isSelected ? (gradient.first?.opacity(0.3) ?? .clear) : .clear, radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

struct PremiumPartnerCard: View {
    let partner: Partner
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            if let url = URL(string: partner.websiteURL ?? "") {
                UIApplication.shared.open(url)
            }
        }) {
            HStack(spacing: 20) {
                // Премиальный логотип
                ZStack {
                    AsyncImage(url: URL(string: partner.logoURL ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        colorForCategory(partner.category).opacity(0.8),
                                        colorForCategory(partner.category).opacity(0.6)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2), lineWidth: 2)
                    )
                    .shadow(color: colorForCategory(partner.category).opacity(0.3), radius: 10, x: 0, y: 5)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(partner.name)
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.right.square.fill")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Text(partner.description)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        HStack(spacing: 8) {
                            Image(systemName: iconForCategory(partner.category))
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            Text(partner.category.displayName)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        Spacer()
                    }
                }
            }
            .padding(24)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    colorForCategory(partner.category).opacity(0.9),
                                    colorForCategory(partner.category).opacity(0.7),
                                    colorForCategory(partner.category).opacity(0.5)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
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
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                }
            )
            .shadow(color: colorForCategory(partner.category).opacity(0.3), radius: 15, x: 0, y: 8)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
    
    func iconForCategory(_ category: PartnerCategory) -> String {
        switch category {
        case .music: return "music.note"
        case .equipment: return "headphones"
        case .venue: return "building.2"
        case .media: return "play.circle"
        case .other: return "globe"
        }
    }
    
    func colorForCategory(_ category: PartnerCategory) -> Color {
        switch category {
        case .music: return .purple
        case .equipment: return .orange
        case .venue: return .red
        case .media: return .blue
        case .other: return .green
        }
    }
}

struct PremiumEmptyState: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple.opacity(0.3), .blue.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: icon)
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple, .blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            VStack(spacing: 12) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
        }
        .padding(40)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PartnersView()
}