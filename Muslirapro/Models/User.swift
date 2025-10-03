//
//  User.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation

enum UserType: String, Codable {
    case user = "user"
    case artist = "artist"
    case agent = "agent"
}

struct User: Identifiable, Codable {
    let id: UUID
    var userType: UserType
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var country: String
    var profileImage: String?
    var balance: Double
    var referralCode: String
    var invitedFriends: [ReferralFriend]
    var totalEarnings: Double
    var joinDate: Date
    var hasSubscription: Bool
    var isVerified: Bool
    
    // Для артистов
    var artistSpecialty: String?
    var musicGenre: String?
    var bankCardVerification: Bool?
    var passportVerification: Bool?
    var totalFollowers: Int?
    
    // Для агентов
    var companyName: String?
    var companyLogo: String?
    
    init(userType: UserType, firstName: String, lastName: String, email: String, phone: String, country: String) {
        self.id = UUID()
        self.userType = userType
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.country = country
        self.profileImage = nil
        self.balance = 0.0
        self.referralCode = String.randomString(length: 8)
        self.invitedFriends = []
        self.totalEarnings = 0.0
        self.joinDate = Date()
        self.hasSubscription = false
        self.isVerified = false
        self.bankCardVerification = nil
        self.passportVerification = nil
        self.totalFollowers = nil
        self.companyName = nil
        self.companyLogo = nil
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
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

// Специальности артистов
enum ArtistSpecialty: String, CaseIterable {
    case vocalist = "vocalist"
    case pianist = "pianist"
    case arranger = "arranger"
    case violinist = "violinist"
    case saxophonist = "saxophonist"
    case guitarist = "guitarist"
    case drummer = "drummer"
    case dj = "dj"
    case composer = "composer"
    case conductor = "conductor"
    
    var displayName: String {
        switch self {
        case .vocalist: return "Вокалист"
        case .pianist: return "Пианист"
        case .arranger: return "Аранжировщик"
        case .violinist: return "Скрипач"
        case .saxophonist: return "Саксофонист"
        case .guitarist: return "Гитарист"
        case .drummer: return "Барабанщик"
        case .dj: return "DJ"
        case .composer: return "Композитор"
        case .conductor: return "Дирижёр"
        }
    }
}

// Направления музыки
enum MusicGenreType: String, CaseIterable {
    case classical = "classical"
    case rock = "rock"
    case pop = "pop"
    case rap = "rap"
    case traditional = "traditional"
    case poetry = "poetry"
    case jazz = "jazz"
    case electronic = "electronic"
    
    var displayName: String {
        switch self {
        case .classical: return "Классическая"
        case .rock: return "Рок"
        case .pop: return "Эстрада (Pop)"
        case .rap: return "Рэп"
        case .traditional: return "Традиционная"
        case .poetry: return "Поэзия"
        case .jazz: return "Джаз"
        case .electronic: return "Электронная"
        }
    }
}
