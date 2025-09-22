// Элитный JavaScript для MusliraPro

// Инициализация при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

// Основная функция инициализации
function initializeApp() {
    setupSmoothScrolling();
    setupHeaderScroll();
    setupMusicVisualizer();
    setupStreamCards();
    setupMobileMenu();
    setupAnimations();
    setupParallax();
}

// Плавная прокрутка для навигации
function setupSmoothScrolling() {
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            
            if (targetSection) {
                const headerHeight = document.querySelector('.premium-header').offsetHeight;
                const targetPosition = targetSection.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                
                // Обновляем активную ссылку
                updateActiveNavLink(this);
            }
        });
    });
}

// Обновление активной ссылки в навигации
function updateActiveNavLink(activeLink) {
    const navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(link => link.classList.remove('active'));
    activeLink.classList.add('active');
}

// Эффект изменения хедера при прокрутке
function setupHeaderScroll() {
    const header = document.querySelector('.premium-header');
    let lastScrollY = window.scrollY;
    
    window.addEventListener('scroll', function() {
        const currentScrollY = window.scrollY;
        
        if (currentScrollY > 100) {
            header.style.background = 'rgba(0, 0, 0, 0.95)';
            header.style.backdropFilter = 'blur(20px)';
        } else {
            header.style.background = 'rgba(0, 0, 0, 0.9)';
            header.style.backdropFilter = 'blur(20px)';
        }
        
        // Скрытие/показ хедера при прокрутке
        if (currentScrollY > lastScrollY && currentScrollY > 200) {
            header.style.transform = 'translateY(-100%)';
        } else {
            header.style.transform = 'translateY(0)';
        }
        
        lastScrollY = currentScrollY;
    });
}

// Анимированный музыкальный визуализатор
function setupMusicVisualizer() {
    const bars = document.querySelectorAll('.bar');
    
    function animateBars() {
        bars.forEach((bar, index) => {
            const randomHeight = Math.random() * 100 + 20;
            bar.style.height = randomHeight + 'px';
        });
    }
    
    // Запускаем анимацию каждые 200мс
    setInterval(animateBars, 200);
}

// Интерактивность карточек трансляций
function setupStreamCards() {
    const streamCards = document.querySelectorAll('.stream-card');
    
    streamCards.forEach(card => {
        // Эффект наведения
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
            this.style.boxShadow = '0 25px 50px -12px rgba(0, 0, 0, 0.5)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
            this.style.boxShadow = '0 20px 25px -5px rgba(0, 0, 0, 0.1)';
        });
        
        // Клик по карточке
        card.addEventListener('click', function() {
            const title = this.querySelector('.stream-title').textContent;
            showStreamModal(title);
        });
    });
}

// Модальное окно для трансляций
function showStreamModal(title) {
    // Создаем модальное окно
    const modal = document.createElement('div');
    modal.className = 'stream-modal';
    modal.innerHTML = `
        <div class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>${title}</h3>
                    <button class="modal-close">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="video-placeholder">
                        <i class="fas fa-play-circle"></i>
                        <p>Трансляция будет доступна в приложении MusliraPro</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn-download-app">
                        <i class="fas fa-download"></i>
                        Скачать приложение
                    </button>
                </div>
            </div>
        </div>
    `;
    
    // Добавляем стили для модального окна
    const style = document.createElement('style');
    style.textContent = `
        .stream-modal {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 10000;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .modal-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
        }
        
        .modal-content {
            position: relative;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            padding: 2rem;
            max-width: 600px;
            width: 90%;
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .modal-header h3 {
            color: #ffffff;
            font-size: 1.5rem;
        }
        
        .modal-close {
            background: none;
            border: none;
            color: #ffffff;
            font-size: 2rem;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        
        .modal-close:hover {
            color: #8B5CF6;
        }
        
        .video-placeholder {
            text-align: center;
            padding: 3rem;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .video-placeholder i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #8B5CF6;
        }
        
        .btn-download-app {
            background: linear-gradient(135deg, #8B5CF6 0%, #3B82F6 50%, #EC4899 100%);
            color: #ffffff;
            border: none;
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin: 0 auto;
        }
        
        .btn-download-app:hover {
            transform: translateY(-2px);
        }
    `;
    
    document.head.appendChild(style);
    document.body.appendChild(modal);
    
    // Обработчики для закрытия модального окна
    modal.querySelector('.modal-close').addEventListener('click', () => {
        document.body.removeChild(modal);
        document.head.removeChild(style);
    });
    
    modal.querySelector('.modal-overlay').addEventListener('click', (e) => {
        if (e.target === modal.querySelector('.modal-overlay')) {
            document.body.removeChild(modal);
            document.head.removeChild(style);
        }
    });
}

// Мобильное меню
function setupMobileMenu() {
    const mobileMenuBtn = document.querySelector('.mobile-menu');
    const navLinks = document.querySelector('.nav-links');
    
    if (mobileMenuBtn && navLinks) {
        mobileMenuBtn.addEventListener('click', function() {
            navLinks.classList.toggle('mobile-active');
            this.classList.toggle('active');
        });
    }
}

// Анимации при прокрутке
function setupAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);
    
    // Наблюдаем за элементами для анимации
    const animatedElements = document.querySelectorAll('.stream-card, .concert-card, .partner-card, .section-header');
    animatedElements.forEach(el => {
        observer.observe(el);
    });
}

// Параллакс эффект для фоновых элементов
function setupParallax() {
    const floatingNotes = document.querySelectorAll('.floating-note');
    
    window.addEventListener('scroll', function() {
        const scrolled = window.pageYOffset;
        const rate = scrolled * -0.5;
        
        floatingNotes.forEach((note, index) => {
            const speed = (index + 1) * 0.1;
            note.style.transform = `translateY(${rate * speed}px) rotate(${scrolled * 0.1}deg)`;
        });
    });
}

// Обработка кнопок подписки
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('btn-subscribe') || e.target.closest('.btn-subscribe')) {
        e.preventDefault();
        showSubscriptionModal();
    }
    
    if (e.target.classList.contains('btn-buy') || e.target.closest('.btn-buy')) {
        e.preventDefault();
        showTicketModal();
    }
});

// Модальное окно для подписки
function showSubscriptionModal() {
    const modal = document.createElement('div');
    modal.className = 'subscription-modal';
    modal.innerHTML = `
        <div class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fas fa-crown"></i> Премиум подписка</h3>
                    <button class="modal-close">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="subscription-plans">
                        <div class="plan-card featured">
                            <div class="plan-header">
                                <h4>MusliraPro Premium</h4>
                                <div class="plan-price">999 ₽<span>/месяц</span></div>
                            </div>
                            <ul class="plan-features">
                                <li><i class="fas fa-check"></i> Неограниченный доступ к трансляциям</li>
                                <li><i class="fas fa-check"></i> Эксклюзивные концерты</li>
                                <li><i class="fas fa-check"></i> Приоритетная поддержка</li>
                                <li><i class="fas fa-check"></i> Ранний доступ к новому контенту</li>
                            </ul>
                            <button class="btn-subscribe-plan">
                                <i class="fas fa-crown"></i>
                                Оформить подписку
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    // Добавляем стили
    const style = document.createElement('style');
    style.textContent = `
        .subscription-modal .modal-content {
            max-width: 500px;
        }
        
        .plan-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 1rem;
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }
        
        .plan-card.featured {
            border-color: #8B5CF6;
            box-shadow: 0 0 20px rgba(139, 92, 246, 0.3);
        }
        
        .plan-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .plan-header h4 {
            color: #ffffff;
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        
        .plan-price {
            font-size: 2rem;
            font-weight: 700;
            color: #8B5CF6;
        }
        
        .plan-price span {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .plan-features {
            list-style: none;
            margin-bottom: 2rem;
        }
        
        .plan-features li {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
            color: rgba(255, 255, 255, 0.8);
        }
        
        .plan-features i {
            color: #10B981;
        }
        
        .btn-subscribe-plan {
            width: 100%;
            background: linear-gradient(135deg, #8B5CF6 0%, #3B82F6 50%, #EC4899 100%);
            color: #ffffff;
            border: none;
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-subscribe-plan:hover {
            transform: translateY(-2px);
        }
    `;
    
    document.head.appendChild(style);
    document.body.appendChild(modal);
    
    // Обработчики для закрытия
    modal.querySelector('.modal-close').addEventListener('click', () => {
        document.body.removeChild(modal);
        document.head.removeChild(style);
    });
    
    modal.querySelector('.modal-overlay').addEventListener('click', (e) => {
        if (e.target === modal.querySelector('.modal-overlay')) {
            document.body.removeChild(modal);
            document.head.removeChild(style);
        }
    });
}

// Модальное окно для покупки билетов
function showTicketModal() {
    const modal = document.createElement('div');
    modal.className = 'ticket-modal';
    modal.innerHTML = `
        <div class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fas fa-ticket-alt"></i> Покупка билетов</h3>
                    <button class="modal-close">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="ticket-info">
                        <p>Билеты на концерты доступны в приложении MusliraPro</p>
                        <div class="ticket-features">
                            <div class="feature">
                                <i class="fas fa-mobile-alt"></i>
                                <span>Удобная покупка в приложении</span>
                            </div>
                            <div class="feature">
                                <i class="fas fa-qrcode"></i>
                                <span>Электронные билеты</span>
                            </div>
                            <div class="feature">
                                <i class="fas fa-shield-alt"></i>
                                <span>Безопасная оплата</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn-download-app">
                        <i class="fas fa-download"></i>
                        Скачать приложение
                    </button>
                </div>
            </div>
        </div>
    `;
    
    // Добавляем стили
    const style = document.createElement('style');
    style.textContent = `
        .ticket-info {
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
        }
        
        .ticket-features {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .ticket-features .feature {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 0.75rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .ticket-features i {
            color: #8B5CF6;
            font-size: 1.2rem;
        }
    `;
    
    document.head.appendChild(style);
    document.body.appendChild(modal);
    
    // Обработчики для закрытия
    modal.querySelector('.modal-close').addEventListener('click', () => {
        document.body.removeChild(modal);
        document.head.removeChild(style);
    });
    
    modal.querySelector('.modal-overlay').addEventListener('click', (e) => {
        if (e.target === modal.querySelector('.modal-overlay')) {
            document.body.removeChild(modal);
            document.head.removeChild(style);
        }
    });
}

// Добавляем CSS для анимаций
const animationStyles = document.createElement('style');
animationStyles.textContent = `
    .stream-card,
    .concert-card,
    .partner-card,
    .section-header {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.6s ease;
    }
    
    .stream-card.animate-in,
    .concert-card.animate-in,
    .partner-card.animate-in,
    .section-header.animate-in {
        opacity: 1;
        transform: translateY(0);
    }
    
    .nav-links.mobile-active {
        display: flex;
        flex-direction: column;
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.95);
        backdrop-filter: blur(20px);
        padding: 2rem;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }
    
    @media (max-width: 768px) {
        .nav-links {
            display: none;
        }
        
        .nav-links.mobile-active {
            display: flex;
        }
    }
`;
document.head.appendChild(animationStyles);

// Обработка изменения размера окна
window.addEventListener('resize', function() {
    // Закрываем мобильное меню при изменении размера
    const navLinks = document.querySelector('.nav-links');
    const mobileMenuBtn = document.querySelector('.mobile-menu');
    
    if (window.innerWidth > 768) {
        navLinks.classList.remove('mobile-active');
        mobileMenuBtn.classList.remove('active');
    }
});

// Добавляем эффект печатания для заголовка
function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.innerHTML = '';
    
    function type() {
        if (i < text.length) {
            element.innerHTML += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }
    
    type();
}

// Инициализация эффекта печатания для главного заголовка
window.addEventListener('load', function() {
    const heroTitle = document.querySelector('.hero-title');
    if (heroTitle) {
        const originalText = heroTitle.innerHTML;
        setTimeout(() => {
            typeWriter(heroTitle, originalText, 50);
        }, 1000);
    }
});

// Добавляем звуковые эффекты (опционально)
function playClickSound() {
    // Создаем простой звуковой эффект
    const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    const oscillator = audioContext.createOscillator();
    const gainNode = audioContext.createGain();
    
    oscillator.connect(gainNode);
    gainNode.connect(audioContext.destination);
    
    oscillator.frequency.setValueAtTime(800, audioContext.currentTime);
    oscillator.frequency.exponentialRampToValueAtTime(400, audioContext.currentTime + 0.1);
    
    gainNode.gain.setValueAtTime(0.1, audioContext.currentTime);
    gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.1);
    
    oscillator.start(audioContext.currentTime);
    oscillator.stop(audioContext.currentTime + 0.1);
}

// Добавляем звуковые эффекты к кнопкам
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('btn-primary') || 
        e.target.classList.contains('btn-secondary') ||
        e.target.classList.contains('premium-btn')) {
        playClickSound();
    }
});

console.log('🎵 MusliraPro Web Platform загружен успешно!');
