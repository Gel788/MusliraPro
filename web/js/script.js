// Современный JavaScript для Муз Лира Pro

// Данные для моков
const mockVideos = [
    {
        id: 1,
        title: "Электронная ночь в Москве",
        artist: "DJ Муз Лира",
        thumbnail: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop",
        views: 15420,
        duration: "3:45",
        category: "Живые выступления"
    },
    {
        id: 2,
        title: "Мастер-класс: Создание битов",
        artist: "Producer Pro",
        thumbnail: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=300&fit=crop",
        views: 8930,
        duration: "2:30",
        category: "Мастер-классы"
    },
    {
        id: 3,
        title: "Интервью с Группой 'Мелодия'",
        artist: "Муз Лира Медиа",
        thumbnail: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400&h=300&fit=crop",
        views: 5670,
        duration: "15:20",
        category: "Интервью"
    }
];

const mockArtists = [
    {
        id: 1,
        name: "DJ Муз Лира",
        genre: "Electronic",
        avatar: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=400&fit=crop",
        followers: 15420,
        isVerified: true,
        artistNumber: 1
    },
    {
        id: 2,
        name: "Группа 'Мелодия'",
        genre: "Rock",
        avatar: "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=400&h=400&fit=crop",
        followers: 8930,
        isVerified: true,
        artistNumber: 2
    },
    {
        id: 3,
        name: "Producer Pro",
        genre: "Hip-Hop",
        avatar: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=400&h=400&fit=crop",
        followers: 25670,
        isVerified: true,
        artistNumber: 3
    }
];

const mockPartners = [
    {
        id: 1,
        name: "Music Studio Pro",
        category: "Музыка",
        logo: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=200&h=200&fit=crop",
        description: "Профессиональная студия звукозаписи",
        website: "https://example.com"
    },
    {
        id: 2,
        name: "Sound Equipment Co",
        category: "Оборудование",
        logo: "https://images.unsplash.com/photo-1511671782779-c97d3d27a5d4?w=200&h=200&fit=crop",
        description: "Поставщик звукового оборудования",
        website: "https://example.com"
    },
    {
        id: 3,
        name: "Concert Hall",
        category: "Площадки",
        logo: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=200&h=200&fit=crop",
        description: "Концертный зал для выступлений",
        website: "https://example.com"
    }
];

// Инициализация приложения
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

function initializeApp() {
    // Показываем экран приветствия на 3 секунды
    setTimeout(() => {
        startApp();
    }, 3000);
    
    // Инициализируем навигацию
    initializeNavigation();
    
    // Загружаем контент
    loadContent();
}

function startApp() {
    const welcomeScreen = document.getElementById('welcome-screen');
    const mainApp = document.getElementById('main-app');
    
    welcomeScreen.style.opacity = '0';
    welcomeScreen.style.transform = 'scale(0.9)';
    
    setTimeout(() => {
        welcomeScreen.style.display = 'none';
        mainApp.style.display = 'block';
        mainApp.style.opacity = '0';
        mainApp.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            mainApp.style.transition = 'all 0.5s ease';
            mainApp.style.opacity = '1';
            mainApp.style.transform = 'translateY(0)';
        }, 100);
    }, 500);
}

function initializeNavigation() {
    const navLinks = document.querySelectorAll('.nav-link');
    const sections = document.querySelectorAll('.section');
    
    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetSection = link.getAttribute('data-section');
            showSection(targetSection);
            
            // Обновляем активную ссылку
            navLinks.forEach(l => l.classList.remove('active'));
            link.classList.add('active');
        });
    });
}

function showSection(sectionId) {
    const sections = document.querySelectorAll('.section');
    const targetSection = document.getElementById(sectionId);
    
    sections.forEach(section => {
        section.classList.remove('active');
    });
    
    if (targetSection) {
        targetSection.classList.add('active');
    }
}

function loadContent() {
    loadVideos();
    loadArtists();
    loadPartners();
}

function loadVideos() {
    const videoGrid = document.getElementById('video-grid');
    if (!videoGrid) return;
    
    videoGrid.innerHTML = mockVideos.map(video => `
        <div class="card">
            <div class="card-image" style="background-image: url('${video.thumbnail}'); background-size: cover; background-position: center;">
                <div style="background: rgba(0,0,0,0.7); padding: 8px 12px; border-radius: 20px; font-size: 0.9rem;">
                    ${video.duration}
                </div>
            </div>
            <div class="card-content">
                <h3 class="card-title">${video.title}</h3>
                <p class="card-subtitle">${video.artist}</p>
                <p class="card-description">
                    👁️ ${video.views.toLocaleString()} просмотров<br>
                    📂 ${video.category}
                </p>
            </div>
        </div>
    `).join('');
}

function loadArtists() {
    const artistGrid = document.getElementById('artist-grid');
    if (!artistGrid) return;
    
    artistGrid.innerHTML = mockArtists.map(artist => `
        <div class="card">
            <div class="card-image" style="background-image: url('${artist.avatar}'); background-size: cover; background-position: center;">
                <div style="background: rgba(0,0,0,0.8); padding: 4px 8px; border-radius: 12px; font-size: 0.8rem; margin: 8px;">
                    #${artist.artistNumber}
                </div>
            </div>
            <div class="card-content">
                <h3 class="card-title">${artist.name}</h3>
                <p class="card-subtitle">${artist.genre}</p>
                <p class="card-description">
                    👥 ${artist.followers.toLocaleString()} подписчиков<br>
                    ${artist.isVerified ? '✅ Проверенный артист' : '⏳ Не проверен'}
                </p>
            </div>
        </div>
    `).join('');
}

function loadPartners() {
    const partnerGrid = document.getElementById('partner-grid');
    if (!partnerGrid) return;
    
    partnerGrid.innerHTML = mockPartners.map(partner => `
        <div class="card">
            <div class="card-image" style="background-image: url('${partner.logo}'); background-size: cover; background-position: center;">
                <div style="background: rgba(0,0,0,0.8); padding: 4px 8px; border-radius: 12px; font-size: 0.8rem; margin: 8px;">
                    ${partner.category}
                </div>
            </div>
            <div class="card-content">
                <h3 class="card-title">${partner.name}</h3>
                <p class="card-subtitle">${partner.category}</p>
                <p class="card-description">${partner.description}</p>
                <button onclick="window.open('${partner.website}', '_blank')" 
                        style="background: linear-gradient(135deg, #ff0000 0%, #ff6600 100%); 
                               color: white; border: none; padding: 8px 16px; 
                               border-radius: 8px; cursor: pointer; margin-top: 12px;">
                    Перейти на сайт
                </button>
            </div>
        </div>
    `).join('');
}

// Поиск
document.addEventListener('DOMContentLoaded', function() {
    const videoSearch = document.getElementById('video-search');
    const artistSearch = document.getElementById('artist-search');
    const partnerSearch = document.getElementById('partner-search');
    
    if (videoSearch) {
        videoSearch.addEventListener('input', (e) => {
            filterContent('video', e.target.value);
        });
    }
    
    if (artistSearch) {
        artistSearch.addEventListener('input', (e) => {
            filterContent('artist', e.target.value);
        });
    }
    
    if (partnerSearch) {
        partnerSearch.addEventListener('input', (e) => {
            filterContent('partner', e.target.value);
        });
    }
});

function filterContent(type, searchTerm) {
    const grid = document.getElementById(`${type}-grid`);
    if (!grid) return;
    
    const cards = grid.querySelectorAll('.card');
    const searchLower = searchTerm.toLowerCase();
    
    cards.forEach(card => {
        const title = card.querySelector('.card-title').textContent.toLowerCase();
        const subtitle = card.querySelector('.card-subtitle').textContent.toLowerCase();
        const description = card.querySelector('.card-description').textContent.toLowerCase();
        
        const matches = title.includes(searchLower) || 
                       subtitle.includes(searchLower) || 
                       description.includes(searchLower);
        
        card.style.display = matches ? 'block' : 'none';
    });
}

// Плавная прокрутка
function smoothScrollTo(element) {
    element.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
    });
}

// Анимации при скролле
function animateOnScroll() {
    const cards = document.querySelectorAll('.card');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    });
    
    cards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'all 0.5s ease';
        observer.observe(card);
    });
}

// Инициализация анимаций
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(animateOnScroll, 1000);
});

// Обработка ошибок изображений
document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.addEventListener('error', function() {
            this.style.display = 'none';
        });
    });
});

// Адаптивное меню для мобильных устройств
function toggleMobileMenu() {
    const navMenu = document.querySelector('.nav-menu');
    navMenu.classList.toggle('mobile-active');
}

// Добавляем обработчик для мобильного меню
document.addEventListener('DOMContentLoaded', function() {
    const navMenu = document.querySelector('.nav-menu');
    if (navMenu) {
        // Добавляем кнопку мобильного меню если нужно
        const mobileMenuButton = document.createElement('button');
        mobileMenuButton.innerHTML = '☰';
        mobileMenuButton.className = 'mobile-menu-button';
        mobileMenuButton.style.display = 'none';
        mobileMenuButton.onclick = toggleMobileMenu;
        
        const navContainer = document.querySelector('.nav-container');
        if (navContainer) {
            navContainer.appendChild(mobileMenuButton);
        }
    }
});

// Показываем кнопку мобильного меню на маленьких экранах
window.addEventListener('resize', function() {
    const mobileMenuButton = document.querySelector('.mobile-menu-button');
    if (mobileMenuButton) {
        if (window.innerWidth <= 768) {
            mobileMenuButton.style.display = 'block';
        } else {
            mobileMenuButton.style.display = 'none';
        }
    }
});
