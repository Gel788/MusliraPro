# 🎵 MusliraPro - Элитная Музыкальная Платформа

<div align="center">
  <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=400&fit=crop" alt="MusliraPro" style="border-radius: 20px; margin: 20px 0;">
  
  [![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)](https://developer.apple.com/ios/)
  [![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0+-green.svg)](https://developer.apple.com/xcode/swiftui/)
  [![Web](https://img.shields.io/badge/Web-HTML5%20%7C%20CSS3%20%7C%20JS-orange.svg)](https://developer.mozilla.org/)
  [![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
</div>

## ✨ Особенности

### 🎯 iOS Приложение
- **Элитный дизайн** мирового уровня с градиентами и анимациями
- **Живые трансляции** с высоким качеством
- **Система концертов** с продажей билетов
- **Чат с музыкантами** и поддержкой
- **Партнерская программа**
- **Профиль пользователя** с премиум функциями

### 🌐 Веб-Версия
- **Адаптивный дизайн** для всех устройств
- **Интерактивные трансляции** с фильтрами
- **Тарифные планы** подписки
- **FAQ и поддержка**
- **Современный UI/UX**

## 🚀 Технологии

### iOS
- **SwiftUI** - современный фреймворк для iOS
- **MVVM** архитектура
- **AsyncImage** для загрузки изображений
- **NavigationView** и **TabView** для навигации

### Web
- **HTML5** - семантическая разметка
- **CSS3** - градиенты, анимации, flexbox/grid
- **JavaScript** - интерактивность и функциональность
- **Font Awesome** - иконки
- **Google Fonts** - типографика

## 📱 Скриншоты

### iOS Приложение
<div align="center">
  <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=300&h=600&fit=crop" alt="iOS App" style="border-radius: 15px; margin: 10px;">
  <img src="https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=300&h=600&fit=crop" alt="iOS App" style="border-radius: 15px; margin: 10px;">
  <img src="https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=300&h=600&fit=crop" alt="iOS App" style="border-radius: 15px; margin: 10px;">
</div>

### Веб-Версия
<div align="center">
  <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=400&fit=crop" alt="Web App" style="border-radius: 15px; margin: 10px;">
</div>

## 🛠 Установка и Запуск

### iOS Приложение
```bash
# Клонируйте репозиторий
git clone https://github.com/Gel788/MusliraPro.git
cd MusliraPro

# Откройте проект в Xcode
open Muslirapro.xcodeproj

# Запустите на симуляторе или устройстве
```

### Веб-Версия
```bash
# Клонируйте репозиторий
git clone https://github.com/Gel788/MusliraPro.git
cd MusliraPro/web

# Откройте index.html в браузере
open index.html

# Или используйте локальный сервер
python -m http.server 8000
# Откройте http://localhost:8000
```

## 📁 Структура Проекта

```
MusliraPro/
├── Muslirapro/                 # iOS приложение
│   ├── Models/                # Модели данных
│   │   ├── User.swift
│   │   ├── Concert.swift
│   │   ├── Message.swift
│   │   └── Partner.swift
│   ├── Views/                 # SwiftUI представления
│   │   ├── MainTabView.swift
│   │   ├── HomeView.swift
│   │   ├── ConcertsView.swift
│   │   ├── ChatListView.swift
│   │   ├── PartnersView.swift
│   │   ├── ProfileView.swift
│   │   └── LoginView.swift
│   └── ViewModels/            # ViewModels
│       └── AuthenticationManager.swift
├── web/                      # Веб-версия
│   ├── index.html            # Главная страница
│   ├── streams.html          # Страница трансляций
│   ├── subscription.html      # Страница подписки
│   ├── css/
│   │   └── style.css         # Стили
│   └── js/
│       ├── script.js         # Основная функциональность
│       ├── streams.js        # Функции трансляций
│       └── subscription.js   # Функции подписки
└── README.md
```

## 🎨 Дизайн

### Цветовая Палитра
- **Основной**: `#8A2BE2` (Фиолетовый)
- **Вторичный**: `#4B0082` (Индиго)
- **Акцент**: `#FF1493` (Розовый)
- **Фон**: `#1a1a2e` (Темно-синий)

### Типографика
- **Заголовки**: Montserrat (900, 700, 400)
- **Основной текст**: Inter (400, 500, 600, 700)

### Градиенты
```css
--primary-gradient: linear-gradient(45deg, #8A2BE2, #4B0082);
--secondary-gradient: linear-gradient(45deg, #FF1493, #FF69B4);
```

## 🌟 Функциональность

### iOS Приложение
- ✅ **Навигация** по табам без регистрации
- ✅ **Живые трансляции** с премиум дизайном
- ✅ **Концерты** с детальной информацией
- ✅ **Чат** с поддержкой и музыкантами
- ✅ **Партнеры** с фильтрацией
- ✅ **Профиль** с гостевым доступом

### Веб-Версия
- ✅ **Адаптивный дизайн** для всех устройств
- ✅ **Интерактивные трансляции** с фильтрами
- ✅ **Тарифные планы** с переключателем
- ✅ **FAQ** с анимациями
- ✅ **Модальные окна** для подписки
- ✅ **Плавные анимации** и переходы

## 🚀 Деплой

### GitHub Pages
Веб-версия автоматически деплоится на GitHub Pages:
- **URL**: https://gel788.github.io/MusliraPro/
- **Источник**: `/web` папка
- **Автодеплой**: при каждом push в main

### iOS App Store
Для публикации в App Store:
1. Откройте проект в Xcode
2. Настройте Bundle Identifier
3. Добавьте иконки и метаданные
4. Архивируйте и загрузите в App Store Connect

## 📊 Аналитика

Проект включает встроенную аналитику для отслеживания:
- Выбор тарифных планов
- Просмотр трансляций
- Взаимодействие с контентом
- Конверсия подписок

## 🤝 Вклад в Проект

1. Форкните репозиторий
2. Создайте ветку для новой функции (`git checkout -b feature/AmazingFeature`)
3. Зафиксируйте изменения (`git commit -m 'Add some AmazingFeature'`)
4. Отправьте в ветку (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📄 Лицензия

Этот проект лицензирован под MIT License - см. файл [LICENSE](LICENSE) для деталей.

## 👥 Команда

- **Разработка**: [@Gel788](https://github.com/Gel788)
- **Дизайн**: Элитный UI/UX мирового уровня
- **Концепция**: MusliraPro - музыкальная платформа будущего

## 📞 Контакты

- **GitHub**: [@Gel788](https://github.com/Gel788)
- **Проект**: [MusliraPro](https://github.com/Gel788/MusliraPro)
- **Веб-версия**: [Live Demo](https://gel788.github.io/MusliraPro/)

---

<div align="center">
  <p>Сделано с ❤️ для ценителей качественной музыки</p>
  <p>🎵 MusliraPro - Звук Будущего 🎵</p>
</div>