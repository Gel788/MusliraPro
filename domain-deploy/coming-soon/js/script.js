// Coming Soon Page JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Initialize all components
    initProgressBar();
    initCountdown();
    initEmailSubscription();
    initAnimations();
});

// Progress Bar Animation
function initProgressBar() {
    const progressFill = document.getElementById('progress-fill');
    const progressPercentage = document.getElementById('progress-percentage');
    
    let progress = 0;
    const targetProgress = 85; // Set your actual progress here
    
    const progressInterval = setInterval(() => {
        progress += Math.random() * 3;
        if (progress >= targetProgress) {
            progress = targetProgress;
            clearInterval(progressInterval);
        }
        
        progressFill.style.width = progress + '%';
        progressPercentage.textContent = Math.round(progress) + '%';
    }, 100);
}

// Countdown Timer
function initCountdown() {
    // Set launch date (adjust as needed)
    const launchDate = new Date();
    launchDate.setDate(launchDate.getDate() + 30); // 30 days from now
    
    const countdownElements = {
        days: document.getElementById('days'),
        hours: document.getElementById('hours'),
        minutes: document.getElementById('minutes'),
        seconds: document.getElementById('seconds')
    };
    
    function updateCountdown() {
        const now = new Date().getTime();
        const distance = launchDate.getTime() - now;
        
        if (distance < 0) {
            // Launch time reached
            Object.values(countdownElements).forEach(el => {
                el.textContent = '00';
            });
            return;
        }
        
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        countdownElements.days.textContent = days.toString().padStart(2, '0');
        countdownElements.hours.textContent = hours.toString().padStart(2, '0');
        countdownElements.minutes.textContent = minutes.toString().padStart(2, '0');
        countdownElements.seconds.textContent = seconds.toString().padStart(2, '0');
    }
    
    // Update immediately and then every second
    updateCountdown();
    setInterval(updateCountdown, 1000);
}

// Email Subscription
function initEmailSubscription() {
    const emailInput = document.getElementById('email-input');
    const subscribeBtn = document.getElementById('subscribe-btn');
    const btnText = subscribeBtn.querySelector('.btn-text');
    const btnLoading = subscribeBtn.querySelector('.btn-loading');
    
    subscribeBtn.addEventListener('click', function() {
        const email = emailInput.value.trim();
        
        if (!isValidEmail(email)) {
            showNotification('Пожалуйста, введите корректный email', 'error');
            return;
        }
        
        // Show loading state
        btnText.style.display = 'none';
        btnLoading.style.display = 'block';
        subscribeBtn.disabled = true;
        
        // Simulate API call
        setTimeout(() => {
            // Hide loading state
            btnText.style.display = 'block';
            btnLoading.style.display = 'none';
            subscribeBtn.disabled = false;
            
            // Show success message
            showNotification('Спасибо! Мы уведомим вас о запуске.', 'success');
            emailInput.value = '';
            
            // Here you would typically send the email to your backend
            console.log('Email subscribed:', email);
        }, 2000);
    });
    
    // Allow Enter key to submit
    emailInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            subscribeBtn.click();
        }
    });
}

// Email validation
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Notification system
function showNotification(message, type = 'info') {
    // Remove existing notifications
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notification => notification.remove());
    
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    // Add styles
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 8px;
        color: white;
        font-weight: 500;
        z-index: 1000;
        transform: translateX(100%);
        transition: transform 0.3s ease;
        max-width: 300px;
        word-wrap: break-word;
    `;
    
    // Set background color based on type
    if (type === 'success') {
        notification.style.background = 'linear-gradient(135deg, #4CAF50, #45a049)';
    } else if (type === 'error') {
        notification.style.background = 'linear-gradient(135deg, #f44336, #d32f2f)';
    } else {
        notification.style.background = 'linear-gradient(135deg, #2196F3, #1976D2)';
    }
    
    document.body.appendChild(notification);
    
    // Animate in
    setTimeout(() => {
        notification.style.transform = 'translateX(0)';
    }, 100);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        notification.style.transform = 'translateX(100%)';
        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, 300);
    }, 5000);
}

// Initialize animations
function initAnimations() {
    // Intersection Observer for scroll animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    // Observe all animated elements
    const animatedElements = document.querySelectorAll('.feature-item, .time-unit, .social-link');
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
}

// Add some interactive effects
document.addEventListener('DOMContentLoaded', function() {
    // Add hover effects to time units
    const timeUnits = document.querySelectorAll('.time-unit');
    timeUnits.forEach(unit => {
        unit.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px) scale(1.05)';
        });
        
        unit.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // Add click effects to feature items
    const featureItems = document.querySelectorAll('.feature-item');
    featureItems.forEach(item => {
        item.addEventListener('click', function() {
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = 'scale(1)';
            }, 150);
        });
    });
    
    // Add ripple effect to buttons
    const buttons = document.querySelectorAll('.subscribe-btn, .social-link');
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${x}px;
                top: ${y}px;
                background: rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                transform: scale(0);
                animation: ripple 0.6s linear;
                pointer-events: none;
            `;
            
            this.style.position = 'relative';
            this.style.overflow = 'hidden';
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
    
    // Add ripple animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(style);
});

// Performance optimization
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Add scroll-based parallax effect
window.addEventListener('scroll', debounce(() => {
    const scrolled = window.pageYOffset;
    const parallax = document.querySelector('.bg-gradient');
    if (parallax) {
        const speed = scrolled * 0.5;
        parallax.style.transform = `translateY(${speed}px)`;
    }
}, 10));

// Add keyboard navigation
document.addEventListener('keydown', function(e) {
    if (e.key === 'Tab') {
        document.body.classList.add('keyboard-navigation');
    }
});

document.addEventListener('mousedown', function() {
    document.body.classList.remove('keyboard-navigation');
});

// Add focus styles for keyboard navigation
const focusStyles = document.createElement('style');
focusStyles.textContent = `
    .keyboard-navigation *:focus {
        outline: 2px solid #ff6b6b !important;
        outline-offset: 2px !important;
    }
`;
document.head.appendChild(focusStyles);
