//
//  Artist.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation
import SwiftUI

struct Artist: Identifiable, Codable {
    let id: UUID
    var artistNumber: Int
    var name: String
    var genre: String
    var bio: String
    var avatarURL: String?
    var coverImageURL: String?
    var followers: Int
    var isVerified: Bool
    var socialLinks: [SocialLink]
    var upcomingEvents: Int
    var totalViews: Int
    
    init(artistNumber: Int, name: String, genre: String, bio: String, followers: Int = 0, isVerified: Bool = false) {
        self.id = UUID()
        self.artistNumber = artistNumber
        self.name = name
        self.genre = genre
        self.bio = bio
        self.avatarURL = nil
        self.coverImageURL = nil
        self.followers = followers
        self.isVerified = isVerified
        self.socialLinks = []
        self.upcomingEvents = 0
        self.totalViews = 0
    }
}

struct SocialLink: Identifiable, Codable {
    let id: UUID
    var platform: String
    var url: String
    var icon: String
    
    init(platform: String, url: String, icon: String) {
        self.id = UUID()
        self.platform = platform
        self.url = url
        self.icon = icon
    }
}

enum ArtistGenre: String, CaseIterable, Codable {
    case electronic = "electronic"
    case rock = "rock"
    case pop = "pop"
    case jazz = "jazz"
    case classical = "classical"
    case hip_hop = "hip_hop"
    case folk = "folk"
    case metal = "metal"
    
    var displayName: String {
        switch self {
        case .electronic: return "Электронная"
        case .rock: return "Рок"
        case .pop: return "Поп"
        case .jazz: return "Джаз"
        case .classical: return "Классическая"
        case .hip_hop: return "Хип-хоп"
        case .folk: return "Фолк"
        case .metal: return "Метал"
        }
    }
    
    var icon: String {
        switch self {
        case .electronic: return "music.note.house"
        case .rock: return "guitar"
        case .pop: return "star"
        case .jazz: return "music.note"
        case .classical: return "piano"
        case .hip_hop: return "mic"
        case .folk: return "leaf"
        case .metal: return "flame"
        }
    }
    
    var color: Color {
        switch self {
        case .electronic: return .purple
        case .rock: return .red
        case .pop: return .pink
        case .jazz: return .blue
        case .classical: return .orange
        case .hip_hop: return .green
        case .folk: return .mint
        case .metal: return .gray
        }
    }
}
