//
//  RegistrationSelectionView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct RegistrationSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedUserType: UserType?
    
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
                            Color.red.opacity(0.1),
                            Color.clear
                        ]),
                        center: .topTrailing,
                        startRadius: 100,
                        endRadius: 400
                    )
                    .ignoresSafeArea()
                }
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Заголовок
                        VStack(spacing: 16) {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                            
                            Text("Выберите тип аккаунта")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Выберите, кто вы, чтобы продолжить регистрацию")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 40)
                        
                        // Карточки выбора типа пользователя
                        VStack(spacing: 20) {
                            // Артист
                            NavigationLink(destination: ArtistRegistrationView()) {
                                UserTypeCard(
                                    icon: "🎤",
                                    title: "Артист",
                                    description: "Музыканты, исполнители, DJ",
                                    gradient: [Color.red, Color.orange]
                                )
                            }
                            
                            // Агент/Продюсер
                            NavigationLink(destination: AgentRegistrationView()) {
                                UserTypeCard(
                                    icon: "💼",
                                    title: "Агент (Продюсер)",
                                    description: "Менеджеры, продюсеры, агентства",
                                    gradient: [Color.purple, Color.pink]
                                )
                            }
                            
                            // Обычный пользователь
                            NavigationLink(destination: UserRegistrationView()) {
                                UserTypeCard(
                                    icon: "👤",
                                    title: "Пользователь",
                                    description: "Слушатели и фанаты музыки",
                                    gradient: [Color(red: 0.0, green: 0.5, blue: 1.0), Color(red: 0.5, green: 0.0, blue: 1.0)]
                                )
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        // Кнопка назад
                        Button(action: { dismiss() }) {
                            Text("Уже есть аккаунт? Войти")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct UserTypeCard: View {
    let icon: String
    let title: String
    let description: String
    let gradient: [Color]
    
    var body: some View {
        HStack(spacing: 20) {
            // Иконка
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: gradient),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 70, height: 70)
                
                Text(icon)
                    .font(.system(size: 35))
            }
            
            // Текст
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            // Стрелка
            Image(systemName: "chevron.right")
                .font(.title3)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
        )
    }
}

#Preview {
    RegistrationSelectionView()
}

