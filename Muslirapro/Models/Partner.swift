//
//  Partner.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation

struct Partner: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var logoURL: String?
    var websiteURL: String?
    var category: PartnerCategory
    var isActive: Bool
    
    init(name: String, description: String, category: PartnerCategory, websiteURL: String? = nil) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.logoURL = nil
        self.websiteURL = websiteURL
        self.category = category
        self.isActive = true
    }
}

enum PartnerCategory: String, CaseIterable, Codable {
    case music = "music"
    case equipment = "equipment"
    case venue = "venue"
    case media = "media"
    case other = "other"
    
    var displayName: String {
        switch self {
        case .music: return "Музыка"
        case .equipment: return "Оборудование"
        case .venue: return "Площадки"
        case .media: return "Медиа"
        case .other: return "Другое"
        }
    }
}
