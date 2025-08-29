# 📋 Presentation Template

This is a template for creating new presentations using impress.js.

## 🚀 Quick Start

### Option 1: Online (GitHub Pages)
**Live Presentation:** `https://aneesa.github.io/Impress/[FOLDER-NAME]/`

### Option 2: Local Server
```bash
cd /path/to/Impress
python3 -m http.server 8000
```
Then visit: `http://localhost:8000/[FOLDER-NAME]/`

## 📁 Required Files

```
[FOLDER-NAME]/
├── presentation.html      # Main presentation file
├── index.html            # Landing page
├── README.md             # This file
├── .nojekyll             # For GitHub Pages
├── 404.html              # Custom error page
├── css/
│   ├── impress-common.css
│   └── impress-demo.css
├── js/
│   └── impress.js
├── pics/                 # Your images
├── favicon.png
└── apple-touch-icon.png
```

## 🎨 Customization Steps

1. **Rename the folder** to your topic name
2. **Update `presentation.html`:**
   - Change the title
   - Update content
   - Modify styling colors
3. **Update `index.html`:**
   - Change title and description
   - Update GitHub Pages link
4. **Update `README.md`:**
   - Change title and description
   - Update GitHub Pages URL
5. **Add your images** to the `pics/` folder
6. **Customize CSS** in `presentation.html` for your theme

## 🎮 Navigation Controls

- **Arrow Keys:** Navigate between slides
- **Space/Enter:** Next slide
- **Shift + Arrow:** Previous slide
- **ESC:** Overview mode

## 🌐 GitHub Pages Setup

1. Push to GitHub
2. Go to repository Settings → Pages
3. Select source: "Deploy from a branch"
4. Branch: `main`, Folder: `/ (root)`
5. Your presentation will be at: `https://aneesa.github.io/Impress/[FOLDER-NAME]/`

## 📝 Content Structure

The presentation should follow this structure:
1. **Title slide** with main topic
2. **Introduction** and definitions
3. **Main content** with interactive elements
4. **Summary** or conclusion
5. **Thank you** slide

## 🎯 Interactive Elements

- **Timeline animations**
- **Image slideshows**
- **Calendar visualizations**
- **Journey animations**
- **Custom styling**

---

**Template created by Aneesa Awaludin** 