//
//  AgentRegistrationView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct AgentRegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phone = ""
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
                        Text("💼")
                            .font(.system(size: 60))
                        
                        Text("Регистрация агента")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Заполните данные для создания аккаунта")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    
                    // Форма
                    VStack(spacing: 20) {
                        CustomTextField(icon: "person", placeholder: "Имя", text: $firstName)
                        CustomTextField(icon: "person.fill", placeholder: "Фамилия", text: $lastName)
                        CustomTextField(icon: "phone", placeholder: "Номер телефона", text: $phone, keyboardType: .phonePad)
                        CustomTextField(icon: "envelope", placeholder: "Email", text: $email, keyboardType: .emailAddress)
                        CustomTextField(icon: "globe", placeholder: "Страна", text: $country)
                        
                        CustomSecureField(icon: "lock", placeholder: "Пароль", text: $password)
                        CustomSecureField(icon: "lock.fill", placeholder: "Подтвердите пароль", text: $confirmPassword)
                        
                        // Информация о следующих шагах
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.purple)
                                Text("После регистрации в личном кабинете:")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 8) {
                                    Text("•")
                                    Text("Загрузите логотип компании")
                                }
                                HStack(spacing: 8) {
                                    Text("•")
                                    Text("Укажите юридическое название фирмы")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple.opacity(0.1))
                        )
                        
                        // Кнопка регистрации
                        Button(action: registerAgent) {
                            Text("Зарегистрироваться")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.purple, Color.pink]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
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
    
    private func registerAgent() {
        // Валидация
        guard !firstName.isEmpty, !lastName.isEmpty, !phone.isEmpty, !email.isEmpty, !country.isEmpty else {
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
        alertMessage = "Регистрация прошла успешно! Пожалуйста, заполните информацию о компании в личном кабинете."
        showAlert = true
    }
}

#Preview {
    NavigationView {
        AgentRegistrationView()
    }
}

