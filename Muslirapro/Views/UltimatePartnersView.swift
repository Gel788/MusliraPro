//
//  UltimatePartnersView.swift
//  Muslirapro
//
//  World-Class Partners View
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UltimatePartnersView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    @State private var selectedPartner: PartnerMock?
    @State private var showFilters = false
    
    let categories = ["All", "Studios", "Equipment", "Venues", "Media", "Education"]
    
    let partners = [
        PartnerMock(
            name: "Abbey Road Studios",
            category: "Studios",
            description: "Legendary recording studio since 1931",
            rating: 5.0,
            projectsCount: 1250,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=400&h=400&fit=crop",
            website: "https://abbeyroad.com"
        ),
        PartnerMock(
            name: "Steinway & Sons",
            category: "Equipment",
            description: "Premium piano manufacturer",
            rating: 4.9,
            projectsCount: 890,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=400&h=400&fit=crop",
            website: "https://steinway.com"
        ),
        PartnerMock(
            name: "Carnegie Hall",
            category: "Venues",
            description: "World-renowned concert venue",
            rating: 5.0,
            projectsCount: 2340,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=400&h=400&fit=crop",
            website: "https://carnegiehall.org"
        ),
        PartnerMock(
            name: "Universal Music",
            category: "Media",
            description: "Global music entertainment company",
            rating: 4.8,
            projectsCount: 5670,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=400&fit=crop",
            website: "https://universalmusic.com"
        ),
        PartnerMock(
            name: "Berklee Online",
            category: "Education",
            description: "Online music education platform",
            rating: 4.7,
            projectsCount: 3450,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400&h=400&fit=crop",
            website: "https://online.berklee.edu"
        ),
        PartnerMock(
            name: "Shure Audio",
            category: "Equipment",
            description: "Professional audio equipment",
            rating: 4.9,
            projectsCount: 1890,
            verified: true,
            imageURL: "https://images.unsplash.com/photo-1590602847861-f357a9332bbc?w=400&h=400&fit=crop",
            website: "https://shure.com"
        )
    ]
    
    var filteredPartners: [PartnerMock] {
        var result = partners
        
        if selectedCategory != "All" {
            result = result.filter { $0.category == selectedCategory }
        }
        
        if !searchText.isEmpty {
            result = result.filter { partner in
                partner.name.localizedCaseInsensitiveContains(searchText) ||
                partner.category.localizedCaseInsensitiveContains(searchText)
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
                    
                    // Partners Grid
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(filteredPartners) { partner in
                                PartnerGridCard(partner: partner) {
                                    selectedPartner = partner
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Partners")
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
            .sheet(item: $selectedPartner) { partner in
                PartnerDetailSheet(partner: partner)
            }
            .sheet(isPresented: $showFilters) {
                PartnerFiltersView()
            }
        }
    }
}

// MARK: - Models
struct PartnerMock: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let description: String
    let rating: Double
    let projectsCount: Int
    let verified: Bool
    let imageURL: String
    let website: String
}

// MARK: - Partner Grid Card
struct PartnerGridCard: View {
    let partner: PartnerMock
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 0) {
                // Image
                AsyncImage(url: URL(string: partner.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color(white: 0.15))
                }
                .frame(height: 120)
                .clipped()
                
                // Info
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Text(partner.name)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        if partner.verified {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Text(partner.category)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                    
                    HStack(spacing: 8) {
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                            Text(String(format: "%.1f", partner.rating))
                                .font(.system(size: 11, weight: .medium))
                        }
                        
                        Text("•")
                        
                        Text("\(formatNumber(partner.projectsCount))")
                            .font(.system(size: 11))
                    }
                    .foregroundColor(.white.opacity(0.6))
                }
                .padding(12)
            }
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

// MARK: - Partner Detail Sheet
struct PartnerDetailSheet: View {
    @Environment(\.dismiss) private var dismiss
    let partner: PartnerMock
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        // Header Image
                        AsyncImage(url: URL(string: partner.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Rectangle()
                                .fill(Color(white: 0.15))
                        }
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        
                        VStack(alignment: .leading, spacing: 24) {
                            // Title & Badge
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 8) {
                                    Text(partner.name)
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    if partner.verified {
                                        Image(systemName: "checkmark.seal.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.blue)
                                    }
                                }
                                
                                Text(partner.category)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white.opacity(0.6))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.08))
                                    )
                            }
                            
                            // Description
                            Text(partner.description)
                                .font(.system(size: 15))
                                .foregroundColor(.white.opacity(0.7))
                                .lineSpacing(4)
                            
                            // Stats
                            HStack(spacing: 32) {
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack(spacing: 6) {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 14))
                                        Text(String(format: "%.1f", partner.rating))
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    .foregroundColor(.white)
                                    
                                    Text("Rating")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("\(formatNumber(partner.projectsCount))")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    Text("Projects")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                            }
                            
                            // Action Buttons
                            VStack(spacing: 12) {
                                Button(action: {
                                    if let url = URL(string: partner.website) {
                                        // Open website
                                    }
                                }) {
                                    HStack {
                                        Image(systemName: "safari")
                                        Text("Visit Website")
                                    }
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
                                            Image(systemName: "message.fill")
                                            Text("Contact")
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
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Share")
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
                        .padding(.horizontal, 24)
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

// MARK: - Partner Filters View
struct PartnerFiltersView: View {
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
    UltimatePartnersView()
}

