//
//  CollaborationFormView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct CollaborationFormView: View {
    let artist: Artist?
    let partner: Partner?
    @Environment(\.dismiss) private var dismiss
    @State private var requesterName = ""
    @State private var requesterEmail = ""
    @State private var requesterPhone = ""
    @State private var companyName = ""
    @State private var message = ""
    @State private var showingSuccess = false
    
    init(artist: Artist) {
        self.artist = artist
        self.partner = nil
    }
    
    init(partner: Partner) {
        self.artist = nil
        self.partner = partner
    }
    
    var targetName: String {
        if let artist = artist {
            return artist.name
        } else if let partner = partner {
            return partner.name
        }
        return ""
    }
    
    var requestType: RequestType {
        return artist != nil ? .artist : .partner
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Неоновый градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color.red.opacity(0.1),
                        Color.orange.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Элитный хедер
                        VStack(spacing: 20) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red.opacity(0.2), .orange.opacity(0.1)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 80, height: 80)
                                
                                Image(systemName: requestType.icon)
                                    .font(.system(size: 32))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            }
                            
                            VStack(spacing: 12) {
                                Text("Заявка на сотрудничество")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("с \(targetName)")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 32)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.red.opacity(0.9),
                                                Color.orange.opacity(0.8),
                                                Color.yellow.opacity(0.7)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.2),
                                                Color.clear,
                                                Color.white.opacity(0.1)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                        )
                        .shadow(color: .red.opacity(0.3), radius: 20, x: 0, y: 10)
                        .padding(.horizontal)
                        
                        // Форма заявки
                        VStack(spacing: 20) {
                            // Личная информация
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Личная информация")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 16) {
                                    CollaborationTextField(
                                        title: "Ваше имя *",
                                        text: $requesterName,
                                        placeholder: "Введите ваше имя"
                                    )
                                    
                                    CollaborationTextField(
                                        title: "Email *",
                                        text: $requesterEmail,
                                        placeholder: "example@email.com",
                                        keyboardType: .emailAddress
                                    )
                                    
                                    CollaborationTextField(
                                        title: "Телефон",
                                        text: $requesterPhone,
                                        placeholder: "+7 (999) 123-45-67",
                                        keyboardType: .phonePad
                                    )
                                    
                                    CollaborationTextField(
                                        title: "Название компании",
                                        text: $companyName,
                                        placeholder: "ООО 'Название компании'"
                                    )
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                            
                            // Сообщение
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Сообщение")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Расскажите о вашем предложении:")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                    
                                    TextEditor(text: $message)
                                        .frame(minHeight: 120)
                                        .padding(12)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.white.opacity(0.1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                                )
                                        )
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                            
                            // Кнопка отправки
                            Button(action: {
                                showingSuccess = true
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: "paperplane.fill")
                                        .font(.title3)
                                    
                                    Text("Отправить заявку")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.red, .orange]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.white.opacity(0.2),
                                                        Color.clear
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    }
                                )
                                .shadow(color: .red.opacity(0.3), radius: 10, x: 0, y: 5)
                            }
                            .disabled(requesterName.isEmpty || requesterEmail.isEmpty)
                            .opacity(requesterName.isEmpty || requesterEmail.isEmpty ? 0.6 : 1.0)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Сотрудничество")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
        .alert("Заявка отправлена!", isPresented: $showingSuccess) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Мы свяжемся с вами в ближайшее время для обсуждения сотрудничества")
        }
    }
}

struct CollaborationTextField: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(keyboardType)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
                .foregroundColor(.white)
        }
    }
}

#Preview {
    CollaborationFormView(artist: Artist(artistNumber: 1, name: "Test Artist", genre: "electronic", bio: "Test bio"))
}
