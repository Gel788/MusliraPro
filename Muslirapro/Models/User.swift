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
    var balance: Double
    var referralCode: String
    var invitedFriends: [ReferralFriend]
    var totalEarnings: Double
    var joinDate: Date
    
    init(username: String, email: String, profileImage: String? = nil) {
        self.id = UUID()
        self.username = username
        self.email = email
        self.profileImage = profileImage
        self.balance = 0.0
        self.referralCode = String.randomString(length: 8)
        self.invitedFriends = []
        self.totalEarnings = 0.0
        self.joinDate = Date()
    }
}

struct ReferralFriend: Identifiable, Codable {
    let id: UUID
    var username: String
    var joinDate: Date
    var earnings: Double
    
    init(username: String) {
        self.id = UUID()
        self.username = username
        self.joinDate = Date()
        self.earnings = 0.0
    }
}

extension String {
    static func randomString(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
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
