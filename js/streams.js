// Элитная функциональность для страницы трансляций
document.addEventListener('DOMContentLoaded', function() {
    // Инициализация фильтров
    initFilters();
    
    // Инициализация поиска
    initSearch();
    
    // Инициализация карточек трансляций
    initStreamCards();
    
    // Инициализация анимаций
    initAnimations();
});

// Фильтрация трансляций
function initFilters() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const streamCards = document.querySelectorAll('.stream-card');
    
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Убираем активный класс со всех кнопок
            filterButtons.forEach(btn => btn.classList.remove('active'));
            // Добавляем активный класс к текущей кнопке
            this.classList.add('active');
            
            const filter = this.getAttribute('data-filter');
            
            // Фильтруем карточки
            streamCards.forEach(card => {
                if (filter === 'all' || card.getAttribute('data-category') === filter) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeInUp 0.5s ease-out';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
}

// Поиск по трансляциям
function initSearch() {
    const searchInput = document.querySelector('.search-input');
    const streamCards = document.querySelectorAll('.stream-card');
    
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            streamCards.forEach(card => {
                const title = card.querySelector('.stream-title').textContent.toLowerCase();
                const artist = card.querySelector('.stream-artist').textContent.toLowerCase();
                
                if (title.includes(searchTerm) || artist.includes(searchTerm)) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeInUp 0.5s ease-out';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }
}

// Интерактивность карточек трансляций
function initStreamCards() {
    const streamCards = document.querySelectorAll('.stream-card');
    
    streamCards.forEach(card => {
        // Эффект наведения
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
            this.style.boxShadow = '0 20px 40px rgba(138, 43, 226, 0.3)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
            this.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.2)';
        });
        
        // Клик по карточке
        card.addEventListener('click', function() {
            const isLive = this.classList.contains('live');
            if (isLive) {
                // Для живых трансляций - открываем плеер
                openStreamPlayer(this);
            } else {
                // Для записанных - воспроизводим
                playRecordedStream(this);
            }
        });
        
        // Кнопки действий
        const likeBtn = card.querySelector('.like-btn');
        if (likeBtn) {
            likeBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                toggleLike(this);
            });
        }
        
        const shareBtn = card.querySelector('.share-btn');
        if (shareBtn) {
            shareBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                shareStream(card);
            });
        }
        
        const subscribeBtn = card.querySelector('.subscribe-btn');
        if (subscribeBtn) {
            subscribeBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                toggleSubscribe(this);
            });
        }
    });
}

// Открытие плеера для живых трансляций
function openStreamPlayer(card) {
    const title = card.querySelector('.stream-title').textContent;
    const artist = card.querySelector('.stream-artist').textContent;
    const image = card.querySelector('img').src;
    
    // Создаем модальное окно с плеером
    const modal = document.createElement('div');
    modal.className = 'stream-player-modal';
    modal.innerHTML = `
        <div class="stream-player-overlay">
            <div class="stream-player-container">
                <div class="stream-player-header">
                    <h3>${title}</h3>
                    <button class="close-player-btn">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="stream-player-video">
                    <img src="${image}" alt="${title}">
                    <div class="stream-player-controls">
                        <button class="play-pause-btn">
                            <i class="fas fa-pause"></i>
                        </button>
                        <div class="volume-control">
                            <i class="fas fa-volume-up"></i>
                            <input type="range" min="0" max="100" value="50" class="volume-slider">
                        </div>
                        <div class="fullscreen-btn">
                            <i class="fas fa-expand"></i>
                        </div>
                    </div>
                </div>
                <div class="stream-player-info">
                    <p><strong>${artist}</strong></p>
                    <div class="stream-stats">
                        <span><i class="fas fa-eye"></i> 2,847 зрителей</span>
                        <span><i class="fas fa-heart"></i> 1,234 лайка</span>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
    
    // Закрытие модального окна
    const closeBtn = modal.querySelector('.close-player-btn');
    const overlay = modal.querySelector('.stream-player-overlay');
    
    closeBtn.addEventListener('click', () => {
        document.body.removeChild(modal);
    });
    
    overlay.addEventListener('click', (e) => {
        if (e.target === overlay) {
            document.body.removeChild(modal);
        }
    });
}

// Воспроизведение записанных трансляций
function playRecordedStream(card) {
    const title = card.querySelector('.stream-title').textContent;
    const artist = card.querySelector('.stream-artist').textContent;
    
    // Показываем уведомление
    showNotification(`Воспроизведение: ${title} - ${artist}`, 'info');
    
    // Здесь можно добавить логику для открытия видео плеера
    // или перенаправления на страницу с видео
}

// Переключение лайка
function toggleLike(button) {
    const icon = button.querySelector('i');
    const isLiked = button.classList.contains('liked');
    
    if (isLiked) {
        button.classList.remove('liked');
        icon.className = 'fas fa-heart';
        button.style.color = '';
    } else {
        button.classList.add('liked');
        icon.className = 'fas fa-heart';
        button.style.color = '#ff4757';
        button.style.animation = 'heartBeat 0.6s ease-in-out';
    }
}

// Поделиться трансляцией
function shareStream(card) {
    const title = card.querySelector('.stream-title').textContent;
    const artist = card.querySelector('.stream-artist').textContent;
    
    if (navigator.share) {
        navigator.share({
            title: title,
            text: `Смотрите трансляцию: ${title} - ${artist}`,
            url: window.location.href
        });
    } else {
        // Fallback для браузеров без поддержки Web Share API
        const shareText = `Смотрите трансляцию: ${title} - ${artist}`;
        navigator.clipboard.writeText(shareText).then(() => {
            showNotification('Ссылка скопирована в буфер обмена!', 'success');
        });
    }
}

// Переключение подписки
function toggleSubscribe(button) {
    const icon = button.querySelector('i');
    const isSubscribed = button.classList.contains('subscribed');
    
    if (isSubscribed) {
        button.classList.remove('subscribed');
        icon.className = 'fas fa-bell';
        button.innerHTML = '<i class="fas fa-bell"></i> Подписаться';
        showNotification('Вы отписались от уведомлений', 'info');
    } else {
        button.classList.add('subscribed');
        icon.className = 'fas fa-bell-slash';
        button.innerHTML = '<i class="fas fa-bell-slash"></i> Отписаться';
        showNotification('Вы подписались на уведомления!', 'success');
    }
}

// Показ уведомлений
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <i class="fas fa-${type === 'success' ? 'check-circle' : type === 'error' ? 'exclamation-circle' : 'info-circle'}"></i>
            <span>${message}</span>
        </div>
    `;
    
    document.body.appendChild(notification);
    
    // Анимация появления
    setTimeout(() => {
        notification.classList.add('show');
    }, 100);
    
    // Автоматическое скрытие
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            if (document.body.contains(notification)) {
                document.body.removeChild(notification);
            }
        }, 300);
    }, 3000);
}

// Инициализация анимаций
function initAnimations() {
    // Анимация появления карточек при загрузке
    const streamCards = document.querySelectorAll('.stream-card');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animation = 'fadeInUp 0.6s ease-out';
                entry.target.style.opacity = '1';
            }
        });
    }, { threshold: 0.1 });
    
    streamCards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.animationDelay = `${index * 0.1}s`;
        observer.observe(card);
    });
    
    // Анимация плавающих элементов
    const floatingNotes = document.querySelectorAll('.floating-note');
    floatingNotes.forEach((note, index) => {
        note.style.animationDelay = `${index * 0.5}s`;
    });
}

// CSS анимации (добавляются динамически)
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    @keyframes heartBeat {
        0% { transform: scale(1); }
        50% { transform: scale(1.2); }
        100% { transform: scale(1); }
    }
    
    .stream-player-modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 10000;
        background: rgba(0, 0, 0, 0.9);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .stream-player-container {
        background: #1a1a2e;
        border-radius: 20px;
        overflow: hidden;
        max-width: 800px;
        width: 90%;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
    }
    
    .stream-player-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background: linear-gradient(45deg, #8A2BE2, #4B0082);
        color: white;
    }
    
    .close-player-btn {
        background: none;
        border: none;
        color: white;
        font-size: 1.5em;
        cursor: pointer;
        padding: 10px;
        border-radius: 50%;
        transition: background 0.3s ease;
    }
    
    .close-player-btn:hover {
        background: rgba(255, 255, 255, 0.2);
    }
    
    .stream-player-video {
        position: relative;
        background: #000;
    }
    
    .stream-player-video img {
        width: 100%;
        height: 400px;
        object-fit: cover;
    }
    
    .stream-player-controls {
        position: absolute;
        bottom: 20px;
        left: 20px;
        right: 20px;
        display: flex;
        align-items: center;
        gap: 15px;
        background: rgba(0, 0, 0, 0.7);
        padding: 15px;
        border-radius: 10px;
        backdrop-filter: blur(10px);
    }
    
    .play-pause-btn, .fullscreen-btn {
        background: rgba(255, 255, 255, 0.2);
        border: none;
        color: white;
        padding: 10px;
        border-radius: 50%;
        cursor: pointer;
        transition: background 0.3s ease;
    }
    
    .play-pause-btn:hover, .fullscreen-btn:hover {
        background: rgba(255, 255, 255, 0.3);
    }
    
    .volume-control {
        display: flex;
        align-items: center;
        gap: 10px;
        color: white;
    }
    
    .volume-slider {
        width: 100px;
    }
    
    .stream-player-info {
        padding: 20px;
        color: white;
    }
    
    .stream-stats {
        display: flex;
        gap: 20px;
        margin-top: 10px;
    }
    
    .stream-stats span {
        display: flex;
        align-items: center;
        gap: 5px;
        color: #ccc;
    }
    
    .notification {
        position: fixed;
        top: 20px;
        right: 20px;
        background: #1a1a2e;
        color: white;
        padding: 15px 20px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        transform: translateX(400px);
        transition: transform 0.3s ease;
        z-index: 10001;
    }
    
    .notification.show {
        transform: translateX(0);
    }
    
    .notification-success {
        border-left: 4px solid #2ed573;
    }
    
    .notification-error {
        border-left: 4px solid #ff4757;
    }
    
    .notification-info {
        border-left: 4px solid #3742fa;
    }
    
    .notification-content {
        display: flex;
        align-items: center;
        gap: 10px;
    }
`;
document.head.appendChild(style);
