#!/bin/bash

# MUSLIRA PRO - Web Build Script
# ===========================================

echo "🚀 Starting MUSLIRA PRO Web Build..."
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Clean previous build
echo "${BLUE}🧹 Cleaning previous build...${NC}"
rm -rf build/
rm -f muslira-pro-web-build-*.tar.gz

# Create build directory
echo "${BLUE}📁 Creating build directory...${NC}"
mkdir -p build

# Copy web files
echo "${BLUE}📋 Copying web files...${NC}"
cp -r web/* build/

# Generate build info
echo "${BLUE}📝 Generating build info...${NC}"
cat > build/BUILD_INFO.txt << EOF
===========================================
MUSLIRA PRO - Production Build
===========================================

Build Date: $(date "+%Y-%m-%d %H:%M:%S")
Build Version: 1.0.0
Platform: Web (HTML5 + CSS3 + Vanilla JS)

===========================================
Files Structure:
===========================================

📄 index.html       - Main application page
📁 css/
   └── style.css    - World-class minimalist styles
📁 js/
   └── script.js    - App logic & mock data
🖼️ 7-removebg-preview.png - MUSLIRA logo

===========================================
File Sizes:
===========================================

$(cd build && ls -lh | grep -v total | grep -v BUILD_INFO)

===========================================
Total Build Size: $(du -sh build/ | awk '{print $1}')
===========================================

📊 Statistics:
- Total Files: $(find build/ -type f | wc -l | xargs)
- CSS Lines: $(wc -l build/css/style.css | awk '{print $1}')
- JS Lines: $(wc -l build/js/script.js | awk '{print $1}')
- HTML Lines: $(wc -l build/index.html | awk '{print $1}')

===========================================
Deployment Information:
===========================================

🌐 GitHub Pages: https://gel788.github.io/MusliraPro/
🔧 Local Dev: http://localhost:8000
📦 Repository: https://github.com/Gel788/MusliraPro

Build Status: ✅ SUCCESS
Build ready for deployment!
EOF

# Create archive
BUILD_DATE=$(date +%Y%m%d)
ARCHIVE_NAME="muslira-pro-web-build-${BUILD_DATE}.tar.gz"

echo "${BLUE}📦 Creating archive: ${ARCHIVE_NAME}${NC}"
tar -czf ${ARCHIVE_NAME} build/

# Summary
echo ""
echo "${GREEN}✅ Build completed successfully!${NC}"
echo ""
echo "📊 Build Summary:"
echo "  └── Build Directory: $(pwd)/build/"
echo "  └── Archive: $(pwd)/${ARCHIVE_NAME}"
echo "  └── Archive Size: $(ls -lh ${ARCHIVE_NAME} | awk '{print $5}')"
echo ""
echo "${YELLOW}🌐 Next Steps:${NC}"
echo "  1. Test locally: cd build && python3 -m http.server 8000"
echo "  2. Deploy to GitHub: git push origin main"
echo "  3. View on GitHub Pages: https://gel788.github.io/MusliraPro/"
echo ""
echo "${GREEN}🎉 Ready for deployment!${NC}"

