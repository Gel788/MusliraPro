//
//  ConcertsView.swift
//  Muslirapro
//
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct ConcertsView: View {
    @State private var concerts: [Concert] = []
    @State private var selectedConcert: Concert?
    @State private var searchText = ""
    
    var filteredConcerts: [Concert] {
        if searchText.isEmpty {
            return concerts
        } else {
            return concerts.filter { concert in
                concert.title.localizedCaseInsensitiveContains(searchText) ||
                concert.artist.localizedCaseInsensitiveContains(searchText) ||
                concert.city.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Премиальный градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color.purple.opacity(0.05),
                        Color.blue.opacity(0.03)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    if concerts.isEmpty {
                        // Элитная заглушка
                        VStack(spacing: 30) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple.opacity(0.2), .blue.opacity(0.1)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 120, height: 120)
                                
                                Image(systemName: "music.note.house")
                                    .font(.system(size: 50))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple, .blue]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            }
                            
                            VStack(spacing: 16) {
                                Text("🎵 Концерты скоро появятся!")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.primary, .purple]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("✨ Следите за обновлениями, чтобы не пропустить интересные события")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(filteredConcerts) { concert in
                                    PremiumConcertRow(concert: concert) {
                                        selectedConcert = concert
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .navigationTitle("🎫 Концерты")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "🔍 Поиск концертов...")
            .onAppear {
                loadSampleConcerts()
            }
            .sheet(item: $selectedConcert) { concert in
                ConcertDetailView(concert: concert)
            }
        }
    }
    
    private func loadSampleConcerts() {
        // Крутые моковые данные с красивыми изображениями
        concerts = [
            Concert(
                title: "🔥 Электронная ночь в Москве",
                artist: "DJ Muslira & Friends",
                date: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date(),
                venue: "Клуб 'Энергия'",
                city: "Москва",
                description: "Незабываемая ночь электронной музыки с лучшими диджеями города. Ожидайте потрясающие световые шоу, мощные басы и атмосферу, которая не оставит равнодушным никого!",
                ticketPrice: 2500,
                maxCapacity: 800,
                category: .electronic
            ),
            Concert(
                title: "🎸 Акустический вечер",
                artist: "Группа 'Мелодия'",
                date: Calendar.current.date(byAdding: .day, value: 14, to: Date()) ?? Date(),
                venue: "Театр 'Гармония'",
                city: "Санкт-Петербург",
                description: "Теплый акустический концерт в уютной атмосфере. Интимная обстановка, живая музыка и душевные песни создадут незабываемый вечер.",
                ticketPrice: 1800,
                maxCapacity: 300,
                category: .acoustic
            ),
            Concert(
                title: "🎵 Джаз под звездами",
                artist: "Moscow Jazz Collective",
                date: Calendar.current.date(byAdding: .day, value: 21, to: Date()) ?? Date(),
                venue: "Парк 'Сокольники'",
                city: "Москва",
                description: "Романтический джазовый вечер под открытым небом. Звездное небо, живая музыка и атмосфера настоящего джаза.",
                ticketPrice: 3200,
                maxCapacity: 500,
                category: .jazz
            ),
            Concert(
                title: "🎤 Рок-фестиваль 'Весна'",
                artist: "Various Artists",
                date: Calendar.current.date(byAdding: .day, value: 28, to: Date()) ?? Date(),
                venue: "Стадион 'Лужники'",
                city: "Москва",
                description: "Масштабный рок-фестиваль с участием лучших российских и зарубежных исполнителей. Целый день музыки, еды и развлечений!",
                ticketPrice: 4500,
                maxCapacity: 15000,
                category: .festival
            ),
            Concert(
                title: "🎹 Классика в современности",
                artist: "Симфонический оркестр",
                date: Calendar.current.date(byAdding: .day, value: 35, to: Date()) ?? Date(),
                venue: "Консерватория им. Чайковского",
                city: "Москва",
                description: "Уникальная программа, сочетающая классические произведения с современными аранжировками. Музыка, которая трогает душу.",
                ticketPrice: 2800,
                maxCapacity: 1200,
                category: .classical
            )
        ]
        
        // Добавляем красивые изображения для концертов
        concerts[0].imageURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop"
        concerts[1].imageURL = "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=300&fit=crop"
        concerts[2].imageURL = "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=300&fit=crop"
        concerts[3].imageURL = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=300&fit=crop"
        concerts[4].imageURL = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop"
    }
}

struct PremiumConcertRow: View {
    let concert: Concert
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                // Премиальное изображение концерта
                ZStack {
                    AsyncImage(url: URL(string: concert.imageURL ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        concert.category.color.opacity(0.9),
                                        concert.category.color.opacity(0.7),
                                        concert.category.color.opacity(0.5)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // Элитный градиентный оверлей
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.2),
                                    Color.black.opacity(0.4),
                                    Color.black.opacity(0.6)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: 200)
                    
                    VStack {
                        HStack {
                            Spacer()
                            // Категория концерта
                            Text(concert.category.displayName)
                                .font(.caption)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(concert.category.color.opacity(0.8))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        
                        Spacer()
                        
                        VStack(spacing: 8) {
                            Text(concert.title)
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                            
                            Text(concert.artist)
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 20)
                    }
                }
                
                // Информационная панель
                VStack(spacing: 16) {
                    HStack(spacing: 20) {
                        HStack(spacing: 6) {
                            Image(systemName: "location.fill")
                                .font(.caption)
                                .foregroundColor(.purple)
                            Text("\(concert.venue), \(concert.city)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Image(systemName: "calendar")
                                .font(.caption)
                                .foregroundColor(.blue)
                            Text(concert.date, style: .date)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        if let price = concert.ticketPrice {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Цена")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(Int(price)) ₽")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.purple, .blue]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            }
                        }
                        
                        Spacer()
                        
                        if concert.isAvailable {
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 10, height: 10)
                                    .shadow(color: .green, radius: 4)
                                Text("Доступно")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.green.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.green.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        } else {
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .shadow(color: .red, radius: 4)
                                Text("Продано")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.red.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.1),
                                            Color.clear,
                                            Color.white.opacity(0.05)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                )
            }
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .shadow(color: concert.category.color.opacity(0.2), radius: 20, x: 0, y: 10)
    }
}

struct ConcertDetailView: View {
    let concert: Concert
    @Environment(\.dismiss) private var dismiss
    @State private var showingTicketPurchase = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Красивое изображение концерта
                    ZStack {
                        AsyncImage(url: URL(string: concert.imageURL ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [concert.category.color.opacity(0.8), concert.category.color.opacity(0.6)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .frame(height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        // Градиентный оверлей
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0.7)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(height: 280)
                        
                        VStack {
                            HStack {
                                Spacer()
                                // Категория концерта
                                Text(concert.category.displayName)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(concert.category.color.opacity(0.8))
                                    )
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            
                            Spacer()
                            
                            VStack(spacing: 12) {
                                Text(concert.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                
                                Text(concert.artist)
                                    .font(.title2)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                
                                if concert.isAvailable {
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 12, height: 12)
                                            .shadow(color: .green, radius: 4)
                                        Text("Доступно")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black.opacity(0.4))
                                    )
                                } else {
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 12, height: 12)
                                            .shadow(color: .red, radius: 4)
                                        Text("Продано")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black.opacity(0.4))
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(concert.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(concert.artist)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.purple)
                            Text("\(concert.venue), \(concert.city)")
                                .font(.headline)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.purple)
                            Text(concert.date, style: .date)
                                .font(.headline)
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.purple)
                            Text(concert.date, style: .time)
                                .font(.headline)
                        }
                        
                        if let price = concert.ticketPrice {
                            HStack {
                                Image(systemName: "ticket.fill")
                                    .foregroundColor(.purple)
                                Text("\(Int(price)) ₽")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.purple)
                            }
                        }
                        
                        Text(concert.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)
                        
                        if let capacity = concert.maxCapacity {
                            Text("Вместимость: \(capacity) человек")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    
                    if concert.isAvailable && concert.ticketPrice != nil {
                        Button(action: { showingTicketPurchase = true }) {
                            Text("Купить билет")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.purple)
                                )
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Концерт")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingTicketPurchase) {
            TicketPurchaseView(concert: concert)
        }
    }
}

struct TicketPurchaseView: View {
    let concert: Concert
    @Environment(\.dismiss) private var dismiss
    @State private var ticketCount = 1
    @State private var showingPayment = false
    
    var totalPrice: Double {
        (concert.ticketPrice ?? 0) * Double(ticketCount)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Красивое изображение концерта
                    ZStack {
                        AsyncImage(url: URL(string: concert.imageURL ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [concert.category.color.opacity(0.8), concert.category.color.opacity(0.6)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        // Градиентный оверлей
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0.6)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(height: 200)
                        
                        VStack {
                            Spacer()
                            VStack(spacing: 8) {
                                Text(concert.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                
                                Text(concert.artist)
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    VStack(spacing: 20) {
                        Text("Покупка билетов")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        // Информация о концерте
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.blue)
                                Text(concert.date, style: .date)
                                    .font(.headline)
                            }
                            
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.purple)
                                Text(concert.date, style: .time)
                                    .font(.headline)
                            }
                            
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.green)
                                Text("\(concert.venue), \(concert.city)")
                                    .font(.headline)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemGray6))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                        )
                        
                        // Выбор количества билетов
                        VStack(spacing: 15) {
                            HStack {
                                Text("Количество билетов:")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 20) {
                                Button(action: { if ticketCount > 1 { ticketCount -= 1 } }) {
                                    Image(systemName: "minus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.purple)
                                }
                                .disabled(ticketCount <= 1)
                                
                                Text("\(ticketCount)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(minWidth: 40)
                                
                                Button(action: { ticketCount += 1 }) {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.purple)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                            )
                        }
                        
                        // Итоговая цена
                        HStack {
                            Text("Итого:")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(Int(totalPrice)) ₽")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Кнопка покупки
                        Button(action: { showingPayment = true }) {
                            Text("Перейти к оплате")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Билеты")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingPayment) {
            PaymentView(concert: concert, ticketCount: ticketCount, totalPrice: totalPrice)
        }
    }
}

struct PaymentView: View {
    let concert: Concert
    let ticketCount: Int
    let totalPrice: Double
    @Environment(\.dismiss) private var dismiss
    @State private var paymentMethod = "card"
    @State private var showingSuccess = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Оплата")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Сумма к оплате:")
                        .font(.headline)
                    
                    Text("\(Int(totalPrice)) ₽")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Способ оплаты:")
                        .font(.headline)
                    
                    Picker("Способ оплаты", selection: $paymentMethod) {
                        Text("Банковская карта").tag("card")
                        Text("Apple Pay").tag("applepay")
                        Text("СБП").tag("sbp")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Text("Оплата будет перенаправлена на сайт MusliraPro для безопасной обработки платежа")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Button(action: { showingSuccess = true }) {
                    Text("Оплатить")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple)
                        )
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Оплата")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
        .alert("Оплата успешна!", isPresented: $showingSuccess) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Ваши билеты отправлены на email")
        }
    }
}

#Preview {
    ConcertsView()
}
