//
//  Concert.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation
import SwiftUI

struct Concert: Identifiable, Codable {
    let id: UUID
    var title: String
    var artist: String
    var date: Date
    var venue: String
    var city: String
    var imageURL: String?
    var description: String
    var ticketPrice: Double?
    var isAvailable: Bool
    var maxCapacity: Int?
    var soldTickets: Int
    var category: ConcertCategory
    
    init(title: String, artist: String, date: Date, venue: String, city: String, description: String, ticketPrice: Double? = nil, maxCapacity: Int? = nil, category: ConcertCategory = .electronic) {
        self.id = UUID()
        self.title = title
        self.artist = artist
        self.date = date
        self.venue = venue
        self.city = city
        self.imageURL = nil
        self.description = description
        self.ticketPrice = ticketPrice
        self.isAvailable = true
        self.maxCapacity = maxCapacity
        self.soldTickets = 0
        self.category = category
    }
}

enum ConcertCategory: String, CaseIterable, Codable {
    case electronic = "electronic"
    case acoustic = "acoustic"
    case jazz = "jazz"
    case rock = "rock"
    case classical = "classical"
    case festival = "festival"
    
    var displayName: String {
        switch self {
        case .electronic: return "Электронная"
        case .acoustic: return "Акустическая"
        case .jazz: return "Джаз"
        case .rock: return "Рок"
        case .classical: return "Классическая"
        case .festival: return "Фестиваль"
        }
    }
    
    var icon: String {
        switch self {
        case .electronic: return "music.note.house"
        case .acoustic: return "guitars"
        case .jazz: return "music.note"
        case .rock: return "guitar"
        case .classical: return "piano"
        case .festival: return "star"
        }
    }
    
    var color: Color {
        switch self {
        case .electronic: return .purple
        case .acoustic: return .green
        case .jazz: return .blue
        case .rock: return .red
        case .classical: return .orange
        case .festival: return .pink
        }
    }
}
