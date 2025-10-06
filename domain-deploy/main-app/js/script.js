// World-Class Web App - Muslira Pro

// Mock Data
const videos = [
    {
        id: 1,
        title: "Electronic Symphony Live",
        artist: "DJ Muslira",
        thumbnail: "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800&h=600&fit=crop",
        duration: "2:45:30",
        views: 15420,
        date: "Dec 10, 2024",
        category: "Concerts"
    },
    {
        id: 2,
        title: "Vocal Techniques Masterclass",
        artist: "Maria Johnson",
        thumbnail: "https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=800&h=600&fit=crop",
        duration: "1:30:15",
        views: 8932,
        date: "Dec 8, 2024",
        category: "Masterclass"
    },
    {
        id: 3,
        title: "Interview with Rock Legends",
        artist: "The Warriors",
        thumbnail: "https://images.unsplash.com/photo-1501612780327-45045538702b?w=800&h=600&fit=crop",
        duration: "45:20",
        views: 12450,
        date: "Dec 5, 2024",
        category: "Interviews"
    },
    {
        id: 4,
        title: "Jazz Night Performance",
        artist: "Sarah Blues",
        thumbnail: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800&h=600&fit=crop",
        duration: "2:15:00",
        views: 9876,
        date: "Dec 1, 2024",
        category: "Concerts"
    },
    {
        id: 5,
        title: "Piano Composition Workshop",
        artist: "Elena Volkova",
        thumbnail: "https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=800&h=600&fit=crop",
        duration: "1:45:00",
        views: 7654,
        date: "Nov 28, 2024",
        category: "Masterclass"
    },
    {
        id: 6,
        title: "Rock Festival Highlights 2024",
        artist: "The Warriors",
        thumbnail: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=600&fit=crop",
        duration: "3:20:45",
        views: 25300,
        date: "Nov 25, 2024",
        category: "Concerts"
    },
    {
        id: 7,
        title: "Behind the Scenes: Studio Life",
        artist: "Alex Storm",
        thumbnail: "https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=800&h=600&fit=crop",
        duration: "28:15",
        views: 5432,
        date: "Nov 22, 2024",
        category: "Interviews"
    },
    {
        id: 8,
        title: "Music Production Basics",
        artist: "DJ Muslira",
        thumbnail: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=800&h=600&fit=crop",
        duration: "2:10:30",
        views: 11890,
        date: "Nov 20, 2024",
        category: "Masterclass"
    },
    {
        id: 9,
        title: "Classical Evening with Orchestra",
        artist: "Elena Volkova",
        thumbnail: "https://images.unsplash.com/photo-1465847899084-d164df4dedc6?w=800&h=600&fit=crop",
        duration: "2:35:20",
        views: 18750,
        date: "Nov 18, 2024",
        category: "Concerts"
    },
    {
        id: 10,
        title: "Pop Star Journey: From Zero to Hero",
        artist: "Maria Johnson",
        thumbnail: "https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?w=800&h=600&fit=crop",
        duration: "52:40",
        views: 14230,
        date: "Nov 15, 2024",
        category: "Interviews"
    },
    {
        id: 11,
        title: "Hip-Hop Songwriting Workshop",
        artist: "Alex Storm",
        thumbnail: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=800&h=600&fit=crop",
        duration: "1:55:00",
        views: 9340,
        date: "Nov 12, 2024",
        category: "Masterclass"
    },
    {
        id: 12,
        title: "Smooth Jazz Evening",
        artist: "Sarah Blues",
        thumbnail: "https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=800&h=600&fit=crop",
        duration: "2:05:15",
        views: 10560,
        date: "Nov 10, 2024",
        category: "Concerts"
    }
];

const artists = [
    {
        id: 1,
        name: "Elena Volkova",
        genre: "Classical",
        bio: "Award-winning pianist and composer",
        followers: 125000,
        verified: true,
        rating: 4.9,
        concerts: 45,
        image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop"
    },
    {
        id: 2,
        name: "DJ Muslira",
        genre: "Electronic",
        bio: "Electronic music producer & DJ",
        followers: 89000,
        verified: true,
        rating: 4.8,
        concerts: 67,
        image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop"
    },
    {
        id: 3,
        name: "The Warriors",
        genre: "Rock",
        bio: "Legendary rock band since 2010",
        followers: 234000,
        verified: true,
        rating: 4.9,
        concerts: 102,
        image: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=400&fit=crop"
    },
    {
        id: 4,
        name: "Maria Johnson",
        genre: "Pop",
        bio: "Pop sensation & vocal coach",
        followers: 156000,
        verified: true,
        rating: 4.7,
        concerts: 38,
        image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=400&fit=crop"
    },
    {
        id: 5,
        name: "Sarah Blues",
        genre: "Jazz",
        bio: "Jazz vocalist extraordinaire",
        followers: 92000,
        verified: true,
        rating: 4.8,
        concerts: 54,
        image: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400&h=400&fit=crop"
    },
    {
        id: 6,
        name: "Alex Storm",
        genre: "Rock",
        bio: "Hip-hop artist & producer",
        followers: 78000,
        verified: true,
        rating: 4.6,
        concerts: 29,
        image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=400&fit=crop"
    },
    {
        id: 7,
        name: "Lucia Martinez",
        genre: "Pop",
        bio: "Latin pop star and songwriter",
        followers: 187000,
        verified: true,
        rating: 4.9,
        concerts: 56,
        image: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=400&fit=crop"
    },
    {
        id: 8,
        name: "Marcus Chen",
        genre: "Classical",
        bio: "Virtuoso violinist",
        followers: 98000,
        verified: true,
        rating: 4.8,
        concerts: 72,
        image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop"
    },
    {
        id: 9,
        name: "The Neon Tribe",
        genre: "Electronic",
        bio: "Future bass collective",
        followers: 145000,
        verified: true,
        rating: 4.7,
        concerts: 81,
        image: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400&h=400&fit=crop"
    },
    {
        id: 10,
        name: "Nina Rivers",
        genre: "Jazz",
        bio: "Contemporary jazz pianist",
        followers: 67000,
        verified: true,
        rating: 4.9,
        concerts: 43,
        image: "https://images.unsplash.com/photo-1580489944761-15a19d654956?w=400&h=400&fit=crop"
    },
    {
        id: 11,
        name: "Viktor Stone",
        genre: "Rock",
        bio: "Heavy metal guitarist",
        followers: 210000,
        verified: true,
        rating: 4.8,
        concerts: 95,
        image: "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=400&h=400&fit=crop"
    },
    {
        id: 12,
        name: "Sophie Harmony",
        genre: "Pop",
        bio: "Indie pop singer-songwriter",
        followers: 134000,
        verified: true,
        rating: 4.6,
        concerts: 47,
        image: "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=400&h=400&fit=crop"
    }
];

const partners = [
    {
        id: 1,
        name: "Abbey Road Studios",
        category: "Studios",
        description: "Legendary recording studio",
        rating: 5.0,
        projects: 1250,
        verified: true,
        image: "https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=800&h=600&fit=crop"
    },
    {
        id: 2,
        name: "Steinway & Sons",
        category: "Equipment",
        description: "Premium piano manufacturer",
        rating: 4.9,
        projects: 890,
        verified: true,
        image: "https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=800&h=600&fit=crop"
    },
    {
        id: 3,
        name: "Carnegie Hall",
        category: "Venues",
        description: "World-renowned concert venue",
        rating: 5.0,
        projects: 2340,
        verified: true,
        image: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800&h=600&fit=crop"
    },
    {
        id: 4,
        name: "Universal Music",
        category: "Media",
        description: "Global entertainment company",
        rating: 4.8,
        projects: 5670,
        verified: true,
        image: "https://images.unsplash.com/photo-1571330735066-03aaa9429dba?w=800&h=600&fit=crop"
    },
    {
        id: 5,
        name: "Berklee Online",
        category: "Education",
        description: "Online music education platform",
        rating: 4.7,
        projects: 3450,
        verified: true,
        image: "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800&h=600&fit=crop"
    },
    {
        id: 6,
        name: "Shure Audio",
        category: "Equipment",
        description: "Professional audio equipment",
        rating: 4.9,
        projects: 1890,
        verified: true,
        image: "https://images.unsplash.com/photo-1590602847861-f357a9332bbc?w=800&h=600&fit=crop"
    },
    {
        id: 7,
        name: "Electric Lady Studios",
        category: "Studios",
        description: "Historic NYC recording studio",
        rating: 4.9,
        projects: 1567,
        verified: true,
        image: "https://images.unsplash.com/photo-1598653222000-6b7b7a552625?w=800&h=600&fit=crop"
    },
    {
        id: 8,
        name: "Madison Square Garden",
        category: "Venues",
        description: "Iconic entertainment venue",
        rating: 4.8,
        projects: 3890,
        verified: true,
        image: "https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?w=800&h=600&fit=crop"
    },
    {
        id: 9,
        name: "Sony Music",
        category: "Media",
        description: "Major record label",
        rating: 4.7,
        projects: 4320,
        verified: true,
        image: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=600&fit=crop"
    },
    {
        id: 10,
        name: "Yamaha Corporation",
        category: "Equipment",
        description: "Musical instruments & audio gear",
        rating: 4.8,
        projects: 2670,
        verified: true,
        image: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=800&h=600&fit=crop"
    },
    {
        id: 11,
        name: "Red Rocks Amphitheatre",
        category: "Venues",
        description: "Natural outdoor concert venue",
        rating: 5.0,
        projects: 2100,
        verified: true,
        image: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800&h=600&fit=crop"
    },
    {
        id: 12,
        name: "Warner Music Group",
        category: "Media",
        description: "Global music conglomerate",
        rating: 4.6,
        projects: 3980,
        verified: true,
        image: "https://images.unsplash.com/photo-1478737270239-2f02b77fc618?w=800&h=600&fit=crop"
    }
];

// Utility Functions
function formatNumber(num) {
    if (num >= 1000) {
        return (num / 1000).toFixed(1) + 'K';
    }
    return num.toString();
}

// Start App
function startApp() {
    const welcomeScreen = document.getElementById('welcome-screen');
    const mainApp = document.getElementById('main-app');
    
    welcomeScreen.classList.add('fade-out');
    
    setTimeout(() => {
        welcomeScreen.style.display = 'none';
        mainApp.style.display = 'block';
        setTimeout(() => {
            mainApp.classList.add('active');
        }, 50);
        
        // Load initial data
        loadVideos();
        loadArtists();
        loadPartners();
    }, 600);
}

// Section Navigation
function showSection(sectionId) {
    // Update nav links
    document.querySelectorAll('.nav-link').forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('onclick').includes(sectionId)) {
            link.classList.add('active');
        }
    });
    
    // Update sections
    document.querySelectorAll('.section').forEach(section => {
        section.classList.remove('active');
    });
    
    document.getElementById(sectionId).classList.add('active');
}

// Load Videos
function loadVideos(filter = 'All') {
    const grid = document.getElementById('video-grid');
    const filteredVideos = filter === 'All' ? videos : videos.filter(v => v.category === filter);
    
    grid.innerHTML = filteredVideos.map(video => `
        <div class="video-card">
            <div class="video-thumbnail">
                <img src="${video.thumbnail}" alt="${video.title}">
                <span class="video-duration">${video.duration}</span>
            </div>
            <div class="video-info">
                <div class="video-title">${video.title}</div>
                <div class="video-artist">${video.artist}</div>
                <div class="video-meta">
                    <span>👁️ ${formatNumber(video.views)}</span>
                    <span>•</span>
                    <span>${video.date}</span>
                </div>
            </div>
        </div>
    `).join('');
}

// Load Artists
function loadArtists(filter = 'All') {
    const grid = document.getElementById('artists-grid');
    const filteredArtists = filter === 'All' ? artists : artists.filter(a => a.genre === filter);
    
    grid.innerHTML = filteredArtists.map(artist => `
        <div class="artist-card">
            <div class="artist-header">
                <div class="artist-avatar">
                    <img src="${artist.image}" alt="${artist.name}">
                </div>
                <div class="artist-info">
                    <div class="artist-name">
                        ${artist.name}
                        ${artist.verified ? '<span class="verified-badge">✓</span>' : ''}
                    </div>
                    <div class="artist-genre">${artist.genre}</div>
                    <div class="artist-stats">
                        <span>👥 ${formatNumber(artist.followers)}</span>
                        <span>⭐ ${artist.rating}</span>
                        <span>🎵 ${artist.concerts}</span>
                    </div>
                </div>
            </div>
            <div class="artist-bio">${artist.bio}</div>
        </div>
    `).join('');
}

// Load Partners
function loadPartners(filter = 'All') {
    const grid = document.getElementById('partners-grid');
    const filteredPartners = filter === 'All' ? partners : partners.filter(p => p.category === filter);
    
    grid.innerHTML = filteredPartners.map(partner => `
        <div class="partner-card">
            <div class="partner-image">
                <img src="${partner.image}" alt="${partner.name}">
            </div>
            <div class="partner-info">
                <div class="partner-name">
                    ${partner.name}
                    ${partner.verified ? '<span class="verified-badge">✓</span>' : ''}
                </div>
                <div class="partner-category">${partner.category}</div>
                <div class="partner-stats">
                    <span>⭐ ${partner.rating}</span>
                    <span>•</span>
                    <span>${formatNumber(partner.projects)} projects</span>
                </div>
            </div>
        </div>
    `).join('');
}

// Filter Functions
function filterVideos(category) {
    // Update pills
    document.querySelectorAll('#video-categories .pill').forEach(pill => {
        pill.classList.remove('active');
        if (pill.textContent === category) {
            pill.classList.add('active');
        }
    });
    loadVideos(category);
}

function filterArtists(genre) {
    // Update pills
    document.querySelectorAll('#genre-categories .pill').forEach(pill => {
        pill.classList.remove('active');
        if (pill.textContent === genre) {
            pill.classList.add('active');
        }
    });
    loadArtists(genre);
}

function filterPartners(category) {
    // Update pills
    document.querySelectorAll('#partner-categories .pill').forEach(pill => {
        pill.classList.remove('active');
        if (pill.textContent === category) {
            pill.classList.add('active');
        }
    });
    loadPartners(category);
}

// Search Functions
document.addEventListener('DOMContentLoaded', () => {
    // Video search
    const videoSearch = document.getElementById('video-search');
    if (videoSearch) {
        videoSearch.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase();
            const filtered = videos.filter(v => 
                v.title.toLowerCase().includes(query) || 
                v.artist.toLowerCase().includes(query)
            );
            const grid = document.getElementById('video-grid');
            grid.innerHTML = filtered.map(video => `
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="${video.thumbnail}" alt="${video.title}">
                        <span class="video-duration">${video.duration}</span>
                    </div>
                    <div class="video-info">
                        <div class="video-title">${video.title}</div>
                        <div class="video-artist">${video.artist}</div>
                        <div class="video-meta">
                            <span>👁️ ${formatNumber(video.views)}</span>
                            <span>•</span>
                            <span>${video.date}</span>
                        </div>
                    </div>
                </div>
            `).join('');
        });
    }

    // Artist search
    const artistSearch = document.getElementById('artist-search');
    if (artistSearch) {
        artistSearch.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase();
            const filtered = artists.filter(a => 
                a.name.toLowerCase().includes(query) || 
                a.genre.toLowerCase().includes(query)
            );
            const grid = document.getElementById('artists-grid');
            grid.innerHTML = filtered.map(artist => `
                <div class="artist-card">
                    <div class="artist-header">
                        <div class="artist-avatar">
                            <img src="${artist.image}" alt="${artist.name}">
                        </div>
                        <div class="artist-info">
                            <div class="artist-name">
                                ${artist.name}
                                ${artist.verified ? '<span class="verified-badge">✓</span>' : ''}
                            </div>
                            <div class="artist-genre">${artist.genre}</div>
                            <div class="artist-stats">
                                <span>👥 ${formatNumber(artist.followers)}</span>
                                <span>⭐ ${artist.rating}</span>
                                <span>🎵 ${artist.concerts}</span>
                            </div>
                        </div>
                    </div>
                    <div class="artist-bio">${artist.bio}</div>
                </div>
            `).join('');
        });
    }

    // Partner search
    const partnerSearch = document.getElementById('partner-search');
    if (partnerSearch) {
        partnerSearch.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase();
            const filtered = partners.filter(p => 
                p.name.toLowerCase().includes(query) || 
                p.category.toLowerCase().includes(query)
            );
            const grid = document.getElementById('partners-grid');
            grid.innerHTML = filtered.map(partner => `
                <div class="partner-card">
                    <div class="partner-image">
                        <img src="${partner.image}" alt="${partner.name}">
                    </div>
                    <div class="partner-info">
                        <div class="partner-name">
                            ${partner.name}
                            ${partner.verified ? '<span class="verified-badge">✓</span>' : ''}
                        </div>
                        <div class="partner-category">${partner.category}</div>
                        <div class="partner-stats">
                            <span>⭐ ${partner.rating}</span>
                            <span>•</span>
                            <span>${formatNumber(partner.projects)} projects</span>
                        </div>
                    </div>
                </div>
            `).join('');
        });
    }
});

// Auto-start after 2.5 seconds (like iOS app)
setTimeout(startApp, 2500);
