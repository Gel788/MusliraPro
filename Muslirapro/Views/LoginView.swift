//
//  LoginView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isLoginMode = true
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            // Градиентный фон
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Логотип и заголовок
                VStack(spacing: 20) {
                    Image(systemName: "music.note.house.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    Text("MusliraPro")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Музыкальная платформа нового поколения")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                }
                
                // Форма входа/регистрации
                VStack(spacing: 20) {
                    if !isLoginMode {
                        LoginTextField(
                            text: $username,
                            placeholder: "Имя пользователя",
                            icon: "person.fill"
                        )
                    }
                    
                    LoginTextField(
                        text: $email,
                        placeholder: "Email",
                        icon: "envelope.fill"
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    
                    LoginTextField(
                        text: $password,
                        placeholder: "Пароль",
                        icon: "lock.fill",
                        isSecure: true
                    )
                    
                    // Кнопка входа/регистрации
                    Button(action: handleAuthentication) {
                        Text(isLoginMode ? "Войти" : "Зарегистрироваться")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.2))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                    .disabled(email.isEmpty || password.isEmpty || (!isLoginMode && username.isEmpty))
                    
                    // Переключение режима
                    Button(action: { isLoginMode.toggle() }) {
                        Text(isLoginMode ? "Нет аккаунта? Зарегистрироваться" : "Уже есть аккаунт? Войти")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
        .alert("Ошибка", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func handleAuthentication() {
        if isLoginMode {
            authManager.login(email: email, password: password)
        } else {
            authManager.register(username: username, email: email, password: password)
        }
    }
}

struct LoginTextField: View {
    @Binding var text: String
    let placeholder: String
    let icon: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.7))
                .frame(width: 20)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(.white)
                    .textFieldStyle(PlainTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.white)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
        )
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationManager())
}
