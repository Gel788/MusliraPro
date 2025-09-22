//
//  User.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var username: String
    var email: String
    var profileImage: String?
    var isSubscribed: Bool
    var subscriptionType: SubscriptionType?
    var joinDate: Date
    
    init(username: String, email: String, profileImage: String? = nil) {
        self.id = UUID()
        self.username = username
        self.email = email
        self.profileImage = profileImage
        self.isSubscribed = false
        self.subscriptionType = nil
        self.joinDate = Date()
    }
}

enum SubscriptionType: String, CaseIterable, Codable {
    case basic = "basic"
    case premium = "premium"
    case vip = "vip"
    
    var displayName: String {
        switch self {
        case .basic: return "Базовый"
        case .premium: return "Премиум"
        case .vip: return "VIP"
        }
    }
}
