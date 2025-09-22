// Элитная функциональность для страницы подписки
document.addEventListener('DOMContentLoaded', function() {
    // Инициализация переключателя тарифов
    initPricingToggle();
    
    // Инициализация карточек тарифов
    initPricingCards();
    
    // Инициализация FAQ
    initFAQ();
    
    // Инициализация анимаций
    initAnimations();
    
    // Инициализация CTA кнопок
    initCTAButtons();
});

// Переключатель месячный/годовой
function initPricingToggle() {
    const toggle = document.getElementById('pricing-toggle');
    const monthlyPrices = document.querySelectorAll('.amount.monthly');
    const yearlyPrices = document.querySelectorAll('.amount.yearly');
    
    if (toggle) {
        toggle.addEventListener('change', function() {
            if (this.checked) {
                // Показываем годовые цены
                monthlyPrices.forEach(price => price.style.display = 'none');
                yearlyPrices.forEach(price => price.style.display = 'inline');
                
                // Добавляем анимацию скидки
                addDiscountAnimation();
            } else {
                // Показываем месячные цены
                monthlyPrices.forEach(price => price.style.display = 'inline');
                yearlyPrices.forEach(price => price.style.display = 'none');
                
                // Убираем анимацию скидки
                removeDiscountAnimation();
            }
        });
    }
}

// Анимация скидки
function addDiscountAnimation() {
    const discountBadges = document.querySelectorAll('.discount-badge');
    discountBadges.forEach(badge => {
        badge.style.animation = 'pulse 1s ease-in-out';
    });
}

function removeDiscountAnimation() {
    const discountBadges = document.querySelectorAll('.discount-badge');
    discountBadges.forEach(badge => {
        badge.style.animation = '';
    });
}

// Интерактивность карточек тарифов
function initPricingCards() {
    const pricingCards = document.querySelectorAll('.pricing-card');
    
    pricingCards.forEach(card => {
        // Эффект наведения
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-15px) scale(1.02)';
            this.style.boxShadow = '0 25px 50px rgba(138, 43, 226, 0.3)';
            
            // Подсвечиваем популярную карточку
            if (this.classList.contains('featured')) {
                this.style.border = '2px solid #8A2BE2';
            }
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
            this.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.2)';
            
            if (this.classList.contains('featured')) {
                this.style.border = '2px solid #4B0082';
            }
        });
        
        // Клик по кнопке выбора плана
        const planButton = card.querySelector('.plan-button');
        if (planButton) {
            planButton.addEventListener('click', function() {
                selectPlan(card);
            });
        }
    });
}

// Выбор плана подписки
function selectPlan(card) {
    const planName = card.querySelector('.plan-name').textContent;
    const planPrice = card.querySelector('.amount').textContent;
    const isYearly = document.getElementById('pricing-toggle').checked;
    
    // Показываем модальное окно подтверждения
    showPlanSelectionModal(planName, planPrice, isYearly);
    
    // Анимация выбора
    card.style.animation = 'planSelected 0.6s ease-out';
    
    // Отправляем аналитику
    trackPlanSelection(planName, isYearly);
}

// Модальное окно выбора плана
function showPlanSelectionModal(planName, price, isYearly) {
    const modal = document.createElement('div');
    modal.className = 'plan-selection-modal';
    modal.innerHTML = `
        <div class="modal-overlay">
            <div class="modal-container">
                <div class="modal-header">
                    <h3>Подтверждение подписки</h3>
                    <button class="close-modal-btn">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="modal-content">
                    <div class="selected-plan">
                        <div class="plan-icon">
                            <i class="fas fa-${planName === 'Базовый' ? 'music' : planName === 'Премиум' ? 'crown' : 'gem'}"></i>
                        </div>
                        <h4>${planName}</h4>
                        <p class="plan-price">${price} ₽ ${isYearly ? '/год' : '/месяц'}</p>
                    </div>
                    <div class="payment-options">
                        <h4>Способы оплаты:</h4>
                        <div class="payment-methods">
                            <button class="payment-method active" data-method="card">
                                <i class="fas fa-credit-card"></i>
                                <span>Банковская карта</span>
                            </button>
                            <button class="payment-method" data-method="paypal">
                                <i class="fab fa-paypal"></i>
                                <span>PayPal</span>
                            </button>
                            <button class="payment-method" data-method="crypto">
                                <i class="fab fa-bitcoin"></i>
                                <span>Криптовалюта</span>
                            </button>
                        </div>
                    </div>
                    <div class="modal-actions">
                        <button class="modal-btn secondary" id="cancel-btn">Отмена</button>
                        <button class="modal-btn primary" id="confirm-btn">Подтвердить</button>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
    
    // Обработчики событий
    const closeBtn = modal.querySelector('.close-modal-btn');
    const cancelBtn = modal.querySelector('#cancel-btn');
    const confirmBtn = modal.querySelector('#confirm-btn');
    const paymentMethods = modal.querySelectorAll('.payment-method');
    
    // Закрытие модального окна
    [closeBtn, cancelBtn].forEach(btn => {
        btn.addEventListener('click', () => {
            document.body.removeChild(modal);
        });
    });
    
    // Подтверждение подписки
    confirmBtn.addEventListener('click', () => {
        processSubscription(planName, price, isYearly);
        document.body.removeChild(modal);
    });
    
    // Выбор способа оплаты
    paymentMethods.forEach(method => {
        method.addEventListener('click', function() {
            paymentMethods.forEach(m => m.classList.remove('active'));
            this.classList.add('active');
        });
    });
}

// Обработка подписки
function processSubscription(planName, price, isYearly) {
    // Показываем уведомление
    showNotification(`Подписка "${planName}" активирована!`, 'success');
    
    // Здесь можно добавить логику для обработки платежа
    // Например, перенаправление на платежную систему
    
    // Анимация успеха
    showSuccessAnimation();
    
    // Отправляем аналитику
    trackSubscriptionSuccess(planName, price, isYearly);
}

// Анимация успешной подписки
function showSuccessAnimation() {
    const successOverlay = document.createElement('div');
    successOverlay.className = 'success-overlay';
    successOverlay.innerHTML = `
        <div class="success-content">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h3>Добро пожаловать в MusliraPro!</h3>
            <p>Ваша подписка активирована</p>
        </div>
    `;
    
    document.body.appendChild(successOverlay);
    
    setTimeout(() => {
        successOverlay.classList.add('show');
    }, 100);
    
    setTimeout(() => {
        successOverlay.classList.remove('show');
        setTimeout(() => {
            if (document.body.contains(successOverlay)) {
                document.body.removeChild(successOverlay);
            }
        }, 300);
    }, 3000);
}

// FAQ функциональность
function initFAQ() {
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        const answer = item.querySelector('.faq-answer');
        const chevron = question.querySelector('i');
        
        question.addEventListener('click', function() {
            const isOpen = item.classList.contains('open');
            
            // Закрываем все остальные FAQ
            faqItems.forEach(otherItem => {
                if (otherItem !== item) {
                    otherItem.classList.remove('open');
                    otherItem.querySelector('.faq-answer').style.maxHeight = '0';
                    otherItem.querySelector('.faq-question i').style.transform = 'rotate(0deg)';
                }
            });
            
            // Переключаем текущий FAQ
            if (isOpen) {
                item.classList.remove('open');
                answer.style.maxHeight = '0';
                chevron.style.transform = 'rotate(0deg)';
            } else {
                item.classList.add('open');
                answer.style.maxHeight = answer.scrollHeight + 'px';
                chevron.style.transform = 'rotate(180deg)';
            }
        });
    });
}

// CTA кнопки
function initCTAButtons() {
    const ctaButtons = document.querySelectorAll('.cta-button');
    
    ctaButtons.forEach(button => {
        button.addEventListener('click', function() {
            if (this.classList.contains('primary')) {
                // Перенаправляем на выбор плана
                document.querySelector('.pricing-section').scrollIntoView({
                    behavior: 'smooth'
                });
            } else if (this.classList.contains('secondary')) {
                // Показываем модальное окно бесплатной пробной версии
                showTrialModal();
            }
        });
    });
}

// Модальное окно бесплатной пробной версии
function showTrialModal() {
    const modal = document.createElement('div');
    modal.className = 'trial-modal';
    modal.innerHTML = `
        <div class="modal-overlay">
            <div class="modal-container">
                <div class="modal-header">
                    <h3>Бесплатная пробная версия</h3>
                    <button class="close-modal-btn">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="modal-content">
                    <div class="trial-benefits">
                        <h4>Что включено в пробную версию:</h4>
                        <ul>
                            <li><i class="fas fa-check"></i> Доступ ко всем трансляциям</li>
                            <li><i class="fas fa-check"></i> HD качество</li>
                            <li><i class="fas fa-check"></i> Мобильное приложение</li>
                            <li><i class="fas fa-check"></i> Поддержка 24/7</li>
                        </ul>
                    </div>
                    <div class="trial-form">
                        <input type="email" placeholder="Ваш email" class="trial-input">
                        <button class="trial-btn">Начать пробную версию</button>
                    </div>
                    <p class="trial-note">Без обязательств • Отмена в любое время</p>
                </div>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
    
    // Обработчики событий
    const closeBtn = modal.querySelector('.close-modal-btn');
    const trialBtn = modal.querySelector('.trial-btn');
    const emailInput = modal.querySelector('.trial-input');
    
    closeBtn.addEventListener('click', () => {
        document.body.removeChild(modal);
    });
    
    trialBtn.addEventListener('click', () => {
        const email = emailInput.value;
        if (email && isValidEmail(email)) {
            startTrial(email);
            document.body.removeChild(modal);
        } else {
            showNotification('Пожалуйста, введите корректный email', 'error');
        }
    });
}

// Валидация email
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Запуск пробной версии
function startTrial(email) {
    showNotification('Пробная версия активирована! Проверьте email для подтверждения.', 'success');
    
    // Здесь можно добавить логику для отправки email подтверждения
    // и активации пробной версии
    
    // Отправляем аналитику
    trackTrialStart(email);
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
    
    setTimeout(() => {
        notification.classList.add('show');
    }, 100);
    
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            if (document.body.contains(notification)) {
                document.body.removeChild(notification);
            }
        }, 300);
    }, 3000);
}

// Аналитика
function trackPlanSelection(planName, isYearly) {
    // Здесь можно добавить отправку данных в аналитику
    console.log(`Plan selected: ${planName}, Yearly: ${isYearly}`);
}

function trackSubscriptionSuccess(planName, price, isYearly) {
    // Здесь можно добавить отправку данных в аналитику
    console.log(`Subscription success: ${planName}, Price: ${price}, Yearly: ${isYearly}`);
}

function trackTrialStart(email) {
    // Здесь можно добавить отправку данных в аналитику
    console.log(`Trial started for: ${email}`);
}

// Инициализация анимаций
function initAnimations() {
    // Анимация появления карточек при загрузке
    const pricingCards = document.querySelectorAll('.pricing-card');
    const benefitCards = document.querySelectorAll('.benefit-card');
    const testimonialCards = document.querySelectorAll('.testimonial-card');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animation = 'fadeInUp 0.6s ease-out';
                entry.target.style.opacity = '1';
            }
        });
    }, { threshold: 0.1 });
    
    [...pricingCards, ...benefitCards, ...testimonialCards].forEach((card, index) => {
        card.style.opacity = '0';
        card.style.animationDelay = `${index * 0.1}s`;
        observer.observe(card);
    });
    
    // Анимация плавающих элементов
    const floatingCrowns = document.querySelectorAll('.floating-crown');
    floatingCrowns.forEach((crown, index) => {
        crown.style.animationDelay = `${index * 0.5}s`;
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
    
    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.1); }
    }
    
    @keyframes planSelected {
        0% { transform: scale(1); }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }
    
    .plan-selection-modal, .trial-modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 10000;
        background: rgba(0, 0, 0, 0.8);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .modal-overlay {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .modal-container {
        background: #1a1a2e;
        border-radius: 20px;
        overflow: hidden;
        max-width: 500px;
        width: 90%;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
        animation: modalSlideIn 0.3s ease-out;
    }
    
    @keyframes modalSlideIn {
        from {
            opacity: 0;
            transform: translateY(-50px) scale(0.9);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }
    
    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background: linear-gradient(45deg, #8A2BE2, #4B0082);
        color: white;
    }
    
    .close-modal-btn {
        background: none;
        border: none;
        color: white;
        font-size: 1.5em;
        cursor: pointer;
        padding: 10px;
        border-radius: 50%;
        transition: background 0.3s ease;
    }
    
    .close-modal-btn:hover {
        background: rgba(255, 255, 255, 0.2);
    }
    
    .modal-content {
        padding: 30px;
        color: white;
    }
    
    .selected-plan {
        text-align: center;
        margin-bottom: 30px;
    }
    
    .plan-icon {
        font-size: 3em;
        margin-bottom: 15px;
        color: #8A2BE2;
    }
    
    .plan-price {
        font-size: 2em;
        font-weight: bold;
        color: #8A2BE2;
        margin: 10px 0;
    }
    
    .payment-methods {
        display: flex;
        flex-direction: column;
        gap: 10px;
        margin: 20px 0;
    }
    
    .payment-method {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 15px;
        background: rgba(255, 255, 255, 0.05);
        border: 2px solid transparent;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .payment-method:hover {
        background: rgba(255, 255, 255, 0.1);
    }
    
    .payment-method.active {
        border-color: #8A2BE2;
        background: rgba(138, 43, 226, 0.1);
    }
    
    .modal-actions {
        display: flex;
        gap: 15px;
        margin-top: 30px;
    }
    
    .modal-btn {
        flex: 1;
        padding: 15px;
        border: none;
        border-radius: 10px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .modal-btn.primary {
        background: linear-gradient(45deg, #8A2BE2, #4B0082);
        color: white;
    }
    
    .modal-btn.primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(138, 43, 226, 0.3);
    }
    
    .modal-btn.secondary {
        background: rgba(255, 255, 255, 0.1);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .modal-btn.secondary:hover {
        background: rgba(255, 255, 255, 0.2);
    }
    
    .trial-benefits ul {
        list-style: none;
        padding: 0;
    }
    
    .trial-benefits li {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 10px 0;
        color: #ccc;
    }
    
    .trial-benefits li i {
        color: #2ed573;
    }
    
    .trial-form {
        margin: 20px 0;
    }
    
    .trial-input {
        width: 100%;
        padding: 15px;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 10px;
        color: white;
        margin-bottom: 15px;
    }
    
    .trial-input::placeholder {
        color: #ccc;
    }
    
    .trial-btn {
        width: 100%;
        padding: 15px;
        background: linear-gradient(45deg, #8A2BE2, #4B0082);
        color: white;
        border: none;
        border-radius: 10px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .trial-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(138, 43, 226, 0.3);
    }
    
    .trial-note {
        text-align: center;
        color: #ccc;
        font-size: 0.9em;
        margin-top: 15px;
    }
    
    .success-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.9);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 10001;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .success-overlay.show {
        opacity: 1;
    }
    
    .success-content {
        text-align: center;
        color: white;
        animation: successPop 0.6s ease-out;
    }
    
    @keyframes successPop {
        0% {
            opacity: 0;
            transform: scale(0.5);
        }
        50% {
            transform: scale(1.1);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }
    
    .success-icon {
        font-size: 4em;
        color: #2ed573;
        margin-bottom: 20px;
    }
    
    .success-content h3 {
        font-size: 2em;
        margin-bottom: 10px;
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
    
    .faq-item {
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }
    
    .faq-question {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 0;
        cursor: pointer;
        transition: color 0.3s ease;
    }
    
    .faq-question:hover {
        color: #8A2BE2;
    }
    
    .faq-question h3 {
        margin: 0;
        font-size: 1.1em;
    }
    
    .faq-question i {
        transition: transform 0.3s ease;
    }
    
    .faq-answer {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease;
    }
    
    .faq-answer p {
        padding: 0 0 20px 0;
        margin: 0;
        color: #ccc;
        line-height: 1.6;
    }
`;
document.head.appendChild(style);
