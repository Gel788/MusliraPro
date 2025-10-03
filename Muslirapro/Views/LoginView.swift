//
//  LoginView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var showRegistration = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Элегантный градиентный фон
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black,
                            Color(red: 0.05, green: 0.05, blue: 0.1),
                            Color(red: 0.1, green: 0.05, blue: 0.15)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.red.opacity(0.15),
                            Color.clear
                        ]),
                        center: .topTrailing,
                        startRadius: 100,
                        endRadius: 400
                    )
                    .ignoresSafeArea()
                    
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.orange.opacity(0.08),
                            Color.clear
                        ]),
                        center: .bottomLeading,
                        startRadius: 150,
                        endRadius: 500
                    )
                    .ignoresSafeArea()
                }
                
                ScrollView {
                    VStack(spacing: 40) {
                        // Логотип
                        VStack(spacing: 20) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.9, green: 0.1, blue: 0.1),
                                                Color(red: 0.8, green: 0.3, blue: 0.1),
                                                Color(red: 0.7, green: 0.5, blue: 0.1)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 150, height: 150)
                                    .shadow(color: .red.opacity(0.3), radius: 30, x: 0, y: 15)
                                
                                VStack(spacing: 8) {
                                    Image("Logo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 90, height: 90)
                                    
                                    Text("Pro")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.white.opacity(0.9))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 3)
                                        .background(
                                            Capsule()
                                                .fill(Color.white.opacity(0.2))
                                        )
                                }
                            }
                            
                            VStack(spacing: 8) {
                                Text("Муз Лира")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Text("Музыкальная платформа нового поколения")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(.top, 40)
                        
                        // Форма входа
                        VStack(spacing: 20) {
                            CustomTextField(icon: "envelope", placeholder: "Email", text: $email, keyboardType: .emailAddress)
                            CustomSecureField(icon: "lock", placeholder: "Пароль", text: $password)
                            
                            // Кнопка "Забыли пароль?"
                            HStack {
                                Spacer()
                                Button(action: {
                                    // Логика восстановления пароля
                                }) {
                                    Text("Забыли пароль?")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            
                            // Кнопка входа
                            Button(action: login) {
                                HStack {
                                    Text("Войти")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title3)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.red, Color.orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                                .shadow(color: .red.opacity(0.3), radius: 15, x: 0, y: 8)
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        // Разделитель
                        HStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 1)
                            Text("или")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.horizontal, 12)
                            Rectangle()
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 1)
                        }
                        .padding(.horizontal, 24)
                        
                        // Кнопка регистрации
                        VStack(spacing: 16) {
                            Button(action: { showRegistration = true }) {
                                HStack {
                                    Text("Зарегистрироваться")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Image(systemName: "person.badge.plus")
                                        .font(.title3)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.red, Color.orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ),
                                            lineWidth: 2
                                        )
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.white.opacity(0.05))
                                        )
                                )
                            }
                            
                            Text("Создайте аккаунт артиста, агента или пользователя")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
            }
            .sheet(isPresented: $showRegistration) {
                RegistrationSelectionView()
            }
            .alert("Вход", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func login() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Пожалуйста, заполните все поля"
            showAlert = true
            return
        }
        
        // Здесь будет логика входа
        authManager.login(email: email, password: password)
        dismiss()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationManager())
}
