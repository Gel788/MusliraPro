//
//  CollaborationRequest.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation

struct CollaborationRequest: Identifiable, Codable {
    let id: UUID
    var requestType: RequestType
    var targetId: String // ID артиста или партнера
    var targetName: String
    var requesterName: String
    var requesterEmail: String
    var requesterPhone: String?
    var companyName: String?
    var message: String
    var status: RequestStatus
    var createdAt: Date
    
    init(requestType: RequestType, targetId: String, targetName: String, requesterName: String, requesterEmail: String, message: String) {
        self.id = UUID()
        self.requestType = requestType
        self.targetId = targetId
        self.targetName = targetName
        self.requesterName = requesterName
        self.requesterEmail = requesterEmail
        self.requesterPhone = nil
        self.companyName = nil
        self.message = message
        self.status = .pending
        self.createdAt = Date()
    }
}

enum RequestType: String, CaseIterable, Codable {
    case artist = "artist"
    case partner = "partner"
    
    var displayName: String {
        switch self {
        case .artist: return "Сотрудничество с артистом"
        case .partner: return "Партнерство"
        }
    }
    
    var icon: String {
        switch self {
        case .artist: return "music.note.house.fill"
        case .partner: return "person.2.fill"
        }
    }
}

enum RequestStatus: String, CaseIterable, Codable {
    case pending = "pending"
    case approved = "approved"
    case rejected = "rejected"
    case in_review = "in_review"
    
    var displayName: String {
        switch self {
        case .pending: return "Ожидает рассмотрения"
        case .approved: return "Одобрено"
        case .rejected: return "Отклонено"
        case .in_review: return "На рассмотрении"
        }
    }
    
    var color: String {
        switch self {
        case .pending: return "orange"
        case .approved: return "green"
        case .rejected: return "red"
        case .in_review: return "blue"
        }
    }
}
