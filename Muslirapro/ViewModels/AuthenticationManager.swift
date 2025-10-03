//
//  AuthenticationManager.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import Foundation
import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    init() {
        // Проверяем сохраненную аутентификацию
        checkAuthentication()
    }
    
    func login(email: String, password: String) {
        // Здесь будет логика входа
        // Пока что для демонстрации создаем тестового пользователя
        let user = User(
            userType: .user,
            firstName: "Иван",
            lastName: "Иванов",
            email: email,
            phone: "+7 999 999 99 99",
            country: "Россия"
        )
        currentUser = user
        isAuthenticated = true
        saveAuthentication()
    }
    
    func register(userType: UserType, firstName: String, lastName: String, email: String, phone: String, country: String, password: String) {
        // Здесь будет логика регистрации
        var user = User(
            userType: userType,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            country: country
        )
        currentUser = user
        isAuthenticated = true
        saveAuthentication()
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
        clearAuthentication()
    }
    
    private func checkAuthentication() {
        // Проверяем UserDefaults на наличие сохраненной аутентификации
        if let userData = UserDefaults.standard.data(forKey: "currentUser"),
           let user = try? JSONDecoder().decode(User.self, from: userData) {
            currentUser = user
            isAuthenticated = true
        }
    }
    
    private func saveAuthentication() {
        if let user = currentUser,
           let userData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(userData, forKey: "currentUser")
        }
    }
    
    private func clearAuthentication() {
        UserDefaults.standard.removeObject(forKey: "currentUser")
    }
}
