//
//  AboutView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct AboutView: View {
    @State private var showingContact = false
    
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
                        // Элитный хедер "О нас"
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
                                    .frame(width: 120, height: 120)
                                
                                Text("🎵")
                                    .font(.system(size: 50))
                            }
                            
                            VStack(spacing: 16) {
                                Text("Муз Лира")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("Музыкальная платформа нового поколения")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
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
                        
                        // Информация о платформе
                        VStack(alignment: .leading, spacing: 20) {
                            Text("О платформе")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                            
                            VStack(spacing: 16) {
                                AboutFeatureCard(
                                    icon: "play.circle.fill",
                                    title: "Прямой эфир",
                                    description: "Смотрите живые трансляции в реальном времени",
                                    gradient: [.red, .orange]
                                )
                                
                                AboutFeatureCard(
                                    icon: "video.fill",
                                    title: "Видеоархив",
                                    description: "Доступ к загруженным выступлениям и записям",
                                    gradient: [.orange, .yellow]
                                )
                                
                                AboutFeatureCard(
                                    icon: "dollarsign.circle.fill",
                                    title: "Виртуальная валюта",
                                    description: "Зарабатывайте и тратьте копеечки на платформе",
                                    gradient: [.yellow, .red]
                                )
                                
                                AboutFeatureCard(
                                    icon: "person.2.fill",
                                    title: "Реферальная система",
                                    description: "Приглашайте друзей и получайте бонусы",
                                    gradient: [.red, .pink]
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        // Контактная информация
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Контакты")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                            
                            VStack(spacing: 16) {
                                ContactCard(
                                    icon: "envelope.fill",
                                    title: "Email",
                                    value: "info@muslira.com",
                                    gradient: [.red, .orange]
                                )
                                
                                ContactCard(
                                    icon: "phone.fill",
                                    title: "Телефон",
                                    value: "+7 (999) 123-45-67",
                                    gradient: [.orange, .yellow]
                                )
                                
                                ContactCard(
                                    icon: "location.fill",
                                    title: "Адрес",
                                    value: "Москва, ул. Музыкальная, 1",
                                    gradient: [.yellow, .red]
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        // Кнопка обратной связи
                        Button(action: {
                            showingContact = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "message.fill")
                                    .font(.title3)
                                
                                Text("Связаться с нами")
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
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("О нас")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $showingContact) {
            ContactView()
        }
    }
}

struct AboutFeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let gradient: [Color]
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: gradient),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                    .shadow(color: gradient.first?.opacity(0.3) ?? .clear, radius: 8, x: 0, y: 4)
                
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            gradient.first?.opacity(0.2) ?? .red,
                            gradient.last?.opacity(0.1) ?? .orange
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
}

struct ContactCard: View {
    let icon: String
    let title: String
    let value: String
    let gradient: [Color]
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: gradient),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                    .shadow(color: gradient.first?.opacity(0.3) ?? .clear, radius: 6, x: 0, y: 3)
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.7))
                
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            gradient.first?.opacity(0.15) ?? .red,
                            gradient.last?.opacity(0.1) ?? .orange
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
}

struct ContactView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var showingSuccess = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Связаться с нами")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    TextField("Ваше имя", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                    
                    TextField("Сообщение", text: $message, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .lineLimit(5...10)
                }
                
                Button(action: {
                    showingSuccess = true
                }) {
                    Text("Отправить")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red)
                        )
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Обратная связь")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
        .alert("Сообщение отправлено!", isPresented: $showingSuccess) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Мы свяжемся с вами в ближайшее время")
        }
    }
}

#Preview {
    AboutView()
}
