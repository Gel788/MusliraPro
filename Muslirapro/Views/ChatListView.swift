//
//  ChatListView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct ChatListView: View {
    @State private var chatRooms: [ChatRoom] = []
    @State private var selectedChat: ChatRoom?
    
    var body: some View {
        NavigationView {
            List(chatRooms) { chatRoom in
                ChatRoomRow(chatRoom: chatRoom) {
                    selectedChat = chatRoom
                }
            }
            .navigationTitle("Чаты")
            .onAppear {
                loadChatRooms()
            }
            .sheet(item: $selectedChat) { chatRoom in
                ChatView(chatRoom: chatRoom)
            }
        }
    }
    
    private func loadChatRooms() {
        // Крутые чаты с красивыми данными
        let supportChat = ChatRoom(
            name: "💬 Поддержка MusliraPro",
            participants: [UUID()],
            chatType: .support
        )
        
        let musiciansChat = ChatRoom(
            name: "🎵 Чат музыкантов",
            participants: [UUID()],
            chatType: .musicians
        )
        
        chatRooms = [supportChat, musiciansChat]
    }
}

struct ChatRoomRow: View {
    let chatRoom: ChatRoom
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 15) {
                // Красивый аватар чата
                ZStack {
                    AsyncImage(url: URL(string: avatarURLForChat(chatRoom))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        chatRoom.chatType == .support 
                                            ? Color.blue.opacity(0.8)
                                            : Color.green.opacity(0.8),
                                        chatRoom.chatType == .support 
                                            ? Color.cyan.opacity(0.6)
                                            : Color.mint.opacity(0.6)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    
                    // Иконка типа чата
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: chatRoom.chatType == .support ? "headphones" : "music.note")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(
                                    Circle()
                                        .fill(Color.black.opacity(0.6))
                                )
                        }
                        Spacer()
                    }
                    .padding(4)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(chatRoom.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    if let lastMessage = chatRoom.lastMessage {
                        Text(lastMessage.content)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("Начните общение")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 6) {
                    if let lastMessage = chatRoom.lastMessage {
                        Text(lastMessage.timestamp, style: .time)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        if !lastMessage.isRead {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                                .shadow(color: .blue, radius: 2)
                        }
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func avatarURLForChat(_ chatRoom: ChatRoom) -> String {
        switch chatRoom.chatType {
        case .support:
            return "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=100&h=100&fit=crop"
        case .musicians:
            return "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=100&h=100&fit=crop"
        }
    }
}

struct ChatView: View {
    let chatRoom: ChatRoom
    @Environment(\.dismiss) private var dismiss
    @State private var messages: [Message] = []
    @State private var newMessage = ""
    @State private var currentUser = User(username: "Пользователь", email: "user@example.com")
    
    var body: some View {
        NavigationView {
            VStack {
                // Список сообщений
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(messages) { message in
                            MessageBubble(message: message, isCurrentUser: message.senderId == currentUser.id)
                        }
                    }
                    .padding()
                }
                
                // Поле ввода
                HStack {
                    TextField("Введите сообщение...", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .font(.title2)
                            .foregroundColor(.purple)
                    }
                    .disabled(newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
            }
            .navigationTitle(chatRoom.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                loadSampleMessages()
            }
        }
    }
    
    private func loadSampleMessages() {
        if chatRoom.chatType == .support {
            messages = [
                Message(
                    content: "Добро пожаловать в поддержку MusliraPro! Чем могу помочь?",
                    senderId: UUID(),
                    senderName: "Поддержка"
                ),
                Message(
                    content: "Привет! У меня вопрос по подписке",
                    senderId: currentUser.id,
                    senderName: currentUser.username
                )
            ]
        } else {
            messages = [
                Message(
                    content: "Добро пожаловать в чат музыкантов! Здесь вы можете общаться с коллегами",
                    senderId: UUID(),
                    senderName: "Модератор"
                ),
                Message(
                    content: "Привет всем! Ищу музыкантов для совместного проекта",
                    senderId: currentUser.id,
                    senderName: currentUser.username
                )
            ]
        }
    }
    
    private func sendMessage() {
        guard !newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        let message = Message(
            content: newMessage,
            senderId: currentUser.id,
            senderName: currentUser.username
        )
        
        messages.append(message)
        newMessage = ""
    }
}

struct MessageBubble: View {
    let message: Message
    let isCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }
            
            VStack(alignment: isCurrentUser ? .trailing : .leading, spacing: 4) {
                if !isCurrentUser {
                    Text(message.senderName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(message.content)
                    .font(.body)
                    .foregroundColor(isCurrentUser ? .white : .primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(isCurrentUser ? Color.purple : Color(.systemGray5))
                    )
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            if !isCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatListView()
}
