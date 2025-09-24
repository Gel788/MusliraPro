//
//  VideoItem.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation
import SwiftUI

struct VideoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var artist: String
    var duration: String
    var thumbnailURL: String?
    var videoURL: String?
    var uploadDate: Date
    var views: Int
    var isLive: Bool
    var category: VideoCategory
    
    init(title: String, artist: String, duration: String, videoURL: String? = nil, category: VideoCategory = .performance) {
        self.id = UUID()
        self.title = title
        self.artist = artist
        self.duration = duration
        self.thumbnailURL = nil
        self.videoURL = videoURL
        self.uploadDate = Date()
        self.views = 0
        self.isLive = false
        self.category = category
    }
}

enum VideoCategory: String, CaseIterable, Codable {
    case performance = "performance"
    case tutorial = "tutorial"
    case interview = "interview"
    case behind_scenes = "behind_scenes"
    case live_stream = "live_stream"
    
    var displayName: String {
        switch self {
        case .performance: return "Выступление"
        case .tutorial: return "Мастер-класс"
        case .interview: return "Интервью"
        case .behind_scenes: return "За кулисами"
        case .live_stream: return "Прямой эфир"
        }
    }
    
    var icon: String {
        switch self {
        case .performance: return "music.note"
        case .tutorial: return "book.fill"
        case .interview: return "mic.fill"
        case .behind_scenes: return "camera.fill"
        case .live_stream: return "play.circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .performance: return .red
        case .tutorial: return .orange
        case .interview: return .blue
        case .behind_scenes: return .purple
        case .live_stream: return .green
        }
    }
}
