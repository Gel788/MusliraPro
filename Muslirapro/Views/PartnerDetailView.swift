//
//  PartnerDetailView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct PartnerDetailView: View {
    let partner: Partner
    @Environment(\.dismiss) private var dismiss
    @State private var showingCollaborationForm = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Красивое изображение партнера
                    ZStack {
                        AsyncImage(url: URL(string: partner.logoURL ?? "")) { image in
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
                                // Категория партнера
                                Text(partner.category.displayName)
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
                                Text(partner.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                
                                Text(partner.description)
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(partner.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(partner.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: iconForCategory(partner.category))
                                .foregroundColor(.red)
                            Text(partner.category.displayName)
                                .font(.headline)
                        }
                        
                        if let websiteURL = partner.websiteURL {
                            HStack {
                                Image(systemName: "globe")
                                    .foregroundColor(.blue)
                                Text("Веб-сайт")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Button(action: {
                                    if let url = URL(string: websiteURL) {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    HStack(spacing: 6) {
                                        Text("Перейти")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Image(systemName: "arrow.up.right.square")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
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
                        
                        // Кнопка сотрудничества
                        Button(action: {
                            showingCollaborationForm = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "handshake.fill")
                                    .font(.title3)
                                
                                Text("Подать заявку на партнерство")
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
            .navigationTitle("Партнер")
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
            CollaborationFormView(partner: partner)
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
}

#Preview {
    PartnerDetailView(partner: Partner(name: "Test Partner", description: "Test description", category: .music))
}
