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
    @State private var selectedPartner: Partner?
    
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
                                                    gradient: Gradient(colors: [.white, .red.opacity(0.8)]),
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
                                                        Color.red.opacity(0.9),
                                                        Color.orange.opacity(0.8),
                                                        Color.yellow.opacity(0.7)
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
                            .shadow(color: .red.opacity(0.3), radius: 20, x: 0, y: 10)
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
                                        gradient: [.red, .orange]
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
                                    PremiumPartnerCard(partner: partner) {
                                        selectedPartner = partner
                                    }
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
        .sheet(item: $selectedPartner) { partner in
            PartnerDetailView(partner: partner)
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
        case .music: return .red
        case .equipment: return .orange
        case .venue: return .yellow
        case .media: return .pink
        case .other: return .gray
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
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                // Современная карточка партнера
                ZStack {
                    // Основной контейнер
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                    
                    VStack(spacing: 0) {
                        // Логотип партнера
                        ZStack {
                            AsyncImage(url: URL(string: partner.logoURL ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
                            .frame(height: 120)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 16,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 16
                                )
                            )
                            
                            // Категория в углу
                            VStack {
                                HStack {
                                    Spacer()
                                    Text(partner.category.displayName)
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.black.opacity(0.7))
                                        )
                                }
                                Spacer()
                            }
                            .padding(12)
                        }
                        
                        // Информационная панель
                        VStack(alignment: .leading, spacing: 16) {
                            // Название и кнопка
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(partner.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    Text(partner.category.displayName)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    if let websiteURL = partner.websiteURL, let url = URL(string: websiteURL) {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "arrow.up.right")
                                            .font(.caption)
                                        Text("Сайт")
                                            .font(.caption)
                                            .fontWeight(.medium)
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .fill(colorForCategory(partner.category))
                                    )
                                }
                            }
                            
                            // Описание
                            Text(partner.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
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
        case .music: return .red
        case .equipment: return .orange
        case .venue: return .yellow
        case .media: return .pink
        case .other: return .gray
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
                            gradient: Gradient(colors: [.red.opacity(0.3), .orange.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: icon)
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange]),
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