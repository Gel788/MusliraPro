//
//  UserRegistrationView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UserRegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var country = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            // Фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black,
                    Color(red: 0.05, green: 0.05, blue: 0.1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 25) {
                    // Заголовок
                    VStack(spacing: 12) {
                        Text("👤")
                            .font(.system(size: 60))
                        
                        Text("Регистрация пользователя")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Создайте аккаунт для доступа к платформе")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    
                    // Форма
                    VStack(spacing: 20) {
                        CustomTextField(icon: "person", placeholder: "Имя", text: $firstName)
                        CustomTextField(icon: "person.fill", placeholder: "Фамилия", text: $lastName)
                        CustomTextField(icon: "envelope", placeholder: "Email", text: $email, keyboardType: .emailAddress)
                        CustomTextField(icon: "globe", placeholder: "Страна", text: $country)
                        
                        CustomSecureField(icon: "lock", placeholder: "Пароль", text: $password)
                        CustomSecureField(icon: "lock.fill", placeholder: "Подтвердите пароль", text: $confirmPassword)
                        
                        // Информация
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                Text("Без подписки:")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(.green)
                                    Text("Доступ к прямым эфирам")
                                }
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(.green)
                                    Text("Просмотр видеоархива")
                                }
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(.green)
                                    Text("Общение с артистами")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.1))
                        )
                        
                        // Информация о подписке
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.5))
                                Text("С подпиской:")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.5))
                                    Text("Размещайте свои видео")
                                }
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.5))
                                    Text("Эксклюзивный контент")
                                }
                                HStack(spacing: 8) {
                                    Text("✓")
                                        .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.5))
                                    Text("Приоритетная поддержка")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 1.0, green: 0.0, blue: 0.5).opacity(0.15),
                                            Color(red: 0.6, green: 0.0, blue: 1.0).opacity(0.1)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 1.0, green: 0.0, blue: 0.5).opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Кнопка регистрации
                        Button(action: registerUser) {
                            Text("Зарегистрироваться")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    ZStack {
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.0, green: 0.5, blue: 1.0),
                                                Color(red: 0.5, green: 0.0, blue: 1.0)
                                            ]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.3),
                                                Color.clear
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    }
                                )
                                .cornerRadius(12)
                                .shadow(color: Color(red: 0.3, green: 0.0, blue: 1.0).opacity(0.5), radius: 15, x: 0, y: 8)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.bottom, 40)
            }
        }
        .navigationTitle("Регистрация")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Регистрация", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func registerUser() {
        // Валидация
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !country.isEmpty else {
            alertMessage = "Пожалуйста, заполните все поля"
            showAlert = true
            return
        }
        
        guard password == confirmPassword else {
            alertMessage = "Пароли не совпадают"
            showAlert = true
            return
        }
        
        guard password.count >= 6 else {
            alertMessage = "Пароль должен содержать минимум 6 символов"
            showAlert = true
            return
        }
        
        // Здесь будет логика регистрации
        alertMessage = "Регистрация прошла успешно! Добро пожаловать в MusLira Pro!"
        showAlert = true
    }
}

#Preview {
    NavigationView {
        UserRegistrationView()
    }
}

