//
//  SharedComponents.swift
//  Muslirapro
//
//  Shared UI Components
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

// MARK: - Type Aliases
typealias PremiumLoginView = LoginView

// MARK: - Scale Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

// MARK: - Search Bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.5))
            
            TextField("Search", text: $text)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .accentColor(.white)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.5))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Category Pill
struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: isSelected ? .semibold : .medium))
                .foregroundColor(isSelected ? .black : .white.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.white : Color.white.opacity(0.08))
                )
        }
    }
}

// MARK: - Filter Section
struct FilterSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            content
        }
    }
}

// MARK: - Filter Pills
struct FilterPills: View {
    let options: [String]
    @Binding var selected: String
    
    var body: some View {
        FlowLayout(spacing: 8) {
            ForEach(options, id: \.self) { option in
                Button(action: { selected = option }) {
                    Text(option)
                        .font(.system(size: 14, weight: selected == option ? .semibold : .regular))
                        .foregroundColor(selected == option ? .black : .white.opacity(0.7))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(selected == option ? Color.white : Color.white.opacity(0.08))
                        )
                }
            }
        }
    }
}

// MARK: - Premium Subscription View
struct PremiumSubscriptionView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        // Header
                        VStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [Color.white.opacity(0.2), Color.white.opacity(0.05)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 100, height: 100)
                                
                                Image(systemName: "crown.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                            
                            Text("Muslira Pro")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Unlock premium features and exclusive content")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                        }
                        .padding(.top, 40)
                        
                        // Features
                        VStack(spacing: 16) {
                            FeatureRow(icon: "checkmark.circle.fill", title: "Ad-free experience")
                            FeatureRow(icon: "checkmark.circle.fill", title: "Exclusive live streams")
                            FeatureRow(icon: "checkmark.circle.fill", title: "Early access to concerts")
                            FeatureRow(icon: "checkmark.circle.fill", title: "Direct messaging with artists")
                            FeatureRow(icon: "checkmark.circle.fill", title: "Priority support")
                        }
                        .padding(.horizontal, 24)
                        
                        // Pricing
                        VStack(spacing: 16) {
                            SubscriptionCard(
                                title: "Monthly",
                                price: "₽999",
                                period: "/month",
                                isPopular: false
                            )
                            
                            SubscriptionCard(
                                title: "Annual",
                                price: "₽9,999",
                                period: "/year",
                                isPopular: true
                            )
                        }
                        .padding(.horizontal, 24)
                        
                        // Subscribe Button
                        Button(action: {}) {
                            Text("Start Free Trial")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    Capsule()
                                        .fill(Color.white)
                                )
                        }
                        .padding(.horizontal, 24)
                        
                        Text("Cancel anytime. Terms apply.")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.4))
                    }
                    .padding(.bottom, 40)
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
}

struct FeatureRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
            
            Spacer()
        }
    }
}

struct SubscriptionCard: View {
    let title: String
    let price: String
    let period: String
    let isPopular: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isPopular {
                Text("MOST POPULAR")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(1)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                    )
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(price)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text(period)
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white.opacity(isPopular ? 0.15 : 0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(isPopular ? 0.3 : 0.1), lineWidth: isPopular ? 2 : 1)
                )
        )
    }
}

// MARK: - Flow Layout
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.replacingUnspecifiedDimensions().width, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                lineHeight = max(lineHeight, size.height)
                x += size.width + spacing
            }
            
            size = CGSize(width: maxWidth, height: y + lineHeight)
        }
    }
}

// MARK: - Premium Live Stream View
struct PremiumLiveStreamView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSchedule = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Video Player Area
                ZStack {
                    Rectangle()
                        .fill(Color(white: 0.1))
                        .aspectRatio(16/9, contentMode: .fit)
                    
                    VStack(spacing: 16) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white.opacity(0.6))
                        
                        Text("Live Stream")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("Coming Soon")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                
                // Controls & Info
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Stream Info
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Classical Evening with Elena Volkova")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                            
                            HStack(spacing: 16) {
                                HStack(spacing: 6) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 8, height: 8)
                                    
                                    Text("LIVE")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                                Text("•")
                                    .foregroundColor(.white.opacity(0.4))
                                
                                Text("12.5K viewers")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.6))
                            }
                        }
                        
                        // Action Buttons
                        HStack(spacing: 12) {
                            Button(action: { showSchedule = true }) {
                                HStack {
                                    Image(systemName: "calendar")
                                    Text("Schedule")
                                }
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
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
                                .padding(.vertical, 12)
                                .background(
                                    Capsule()
                                        .fill(Color.white.opacity(0.1))
                                )
                            }
                        }
                        
                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About this stream")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Text("Join us for an evening of classical piano performances featuring works by Chopin, Rachmaninoff, and Debussy.")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                                .lineSpacing(4)
                        }
                    }
                    .padding(24)
                }
            }
            
            // Close Button
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.6))
                            )
                    }
                    .padding(16)
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showSchedule) {
            StreamScheduleView()
        }
    }
}

// MARK: - Stream Schedule View
struct StreamScheduleView: View {
    @Environment(\.dismiss) private var dismiss
    
    let schedule = [
        ScheduleItem(time: "19:00 - 19:30", title: "Opening Performance", artist: "Elena Volkova"),
        ScheduleItem(time: "19:30 - 20:00", title: "Chopin: Nocturnes", artist: "Elena Volkova"),
        ScheduleItem(time: "20:00 - 20:15", title: "Intermission", artist: ""),
        ScheduleItem(time: "20:15 - 20:45", title: "Rachmaninoff: Prelude", artist: "Elena Volkova"),
        ScheduleItem(time: "20:45 - 21:30", title: "Debussy: Suite Bergamasque", artist: "Elena Volkova")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(schedule) { item in
                            ScheduleCard(item: item)
                        }
                    }
                    .padding(24)
                }
            }
            .navigationTitle("Schedule")
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

struct ScheduleItem: Identifiable {
    let id = UUID()
    let time: String
    let title: String
    let artist: String
}

struct ScheduleCard: View {
    let item: ScheduleItem
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.time)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                
                Text(item.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                if !item.artist.isEmpty {
                    Text(item.artist)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            
            Spacer()
        }
        .padding(16)
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
