//
//  ArtistRegistrationView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct ArtistRegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var country = ""
    @State private var selectedSpecialty: ArtistSpecialty = .vocalist
    @State private var selectedGenre: MusicGenreType = .pop
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
                        Text("🎤")
                            .font(.system(size: 60))
                        
                        Text("Регистрация артиста")
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
                        
                        // Специальность
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Специальность")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white.opacity(0.9))
                            
                            Menu {
                                ForEach(ArtistSpecialty.allCases, id: \.self) { specialty in
                                    Button(specialty.displayName) {
                                        selectedSpecialty = specialty
                                    }
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "music.mic")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text(selectedSpecialty.displayName)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                )
                            }
                        }
                        
                        // Направление музыки
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Направление музыки")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white.opacity(0.9))
                            
                            Menu {
                                ForEach(MusicGenreType.allCases, id: \.self) { genre in
                                    Button(genre.displayName) {
                                        selectedGenre = genre
                                    }
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "music.note")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text(selectedGenre.displayName)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                )
                            }
                        }
                        
                        CustomSecureField(icon: "lock", placeholder: "Пароль", text: $password)
                        CustomSecureField(icon: "lock.fill", placeholder: "Подтвердите пароль", text: $confirmPassword)
                        
                        // Информация о верификации
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                Text("После регистрации вам нужно будет:")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 8) {
                                    Text("•")
                                    Text("Загрузить фотографию")
                                }
                                HStack(spacing: 8) {
                                    Text("•")
                                    Text("Верифицироваться через паспорт или банковскую карту")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.1))
                        )
                        
                        // Кнопка регистрации
                        Button(action: registerArtist) {
                            Text("Зарегистрироваться")
                                .font(.headline)
                                .fontWeight(.bold)
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
    
    private func registerArtist() {
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
        alertMessage = "Регистрация прошла успешно! Теперь необходимо верифицировать аккаунт."
        showAlert = true
    }
}

// Вспомогательные компоненты для полей ввода
struct CustomTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.7))
                .frame(width: 20)
            
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
        )
    }
}

struct CustomSecureField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.7))
                .frame(width: 20)
            
            SecureField(placeholder, text: $text)
                .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
        )
    }
}

#Preview {
    NavigationView {
        ArtistRegistrationView()
    }
}

