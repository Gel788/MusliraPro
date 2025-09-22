//
//  Message.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation

struct Message: Identifiable, Codable {
    let id: UUID
    var content: String
    var senderId: UUID
    var senderName: String
    var timestamp: Date
    var messageType: MessageType
    var isRead: Bool
    
    init(content: String, senderId: UUID, senderName: String, messageType: MessageType = .text) {
        self.id = UUID()
        self.content = content
        self.senderId = senderId
        self.senderName = senderName
        self.timestamp = Date()
        self.messageType = messageType
        self.isRead = false
    }
}

enum MessageType: String, Codable {
    case text = "text"
    case image = "image"
    case video = "video"
    case audio = "audio"
}

struct ChatRoom: Identifiable, Codable {
    let id: UUID
    var name: String
    var participants: [UUID]
    var lastMessage: Message?
    var isActive: Bool
    var chatType: ChatType
    
    init(name: String, participants: [UUID], chatType: ChatType) {
        self.id = UUID()
        self.name = name
        self.participants = participants
        self.lastMessage = nil
        self.isActive = true
        self.chatType = chatType
    }
}

enum ChatType: String, Codable {
    case support = "support"
    case musicians = "musicians"
}
