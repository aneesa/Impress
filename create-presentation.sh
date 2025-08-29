#!/bin/bash

# Create New Presentation Script
# Usage: ./create-presentation.sh "Presentation Name"

if [ $# -eq 0 ]; then
    echo "Usage: ./create-presentation.sh \"Presentation Name\""
    echo "Example: ./create-presentation.sh \"Islamic History\""
    exit 1
fi

PRESENTATION_NAME="$1"
FOLDER_NAME=$(echo "$PRESENTATION_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-\|-$//g')

echo "Creating presentation: $PRESENTATION_NAME"
echo "Folder name: $FOLDER_NAME"

# Check if folder already exists
if [ -d "$FOLDER_NAME" ]; then
    echo "Error: Folder '$FOLDER_NAME' already exists!"
    exit 1
fi

# Create the folder
mkdir -p "$FOLDER_NAME"

# Copy template files
echo "Copying template files..."

# Copy the entire Hajj-and-Umrah folder as template
cp -r Hajj-and-Umrah/* "$FOLDER_NAME/"

# Remove specific content files that should be customized
rm -f "$FOLDER_NAME/hajj-and-umrah.html"
rm -f "$FOLDER_NAME/pics/"*

# Create a basic presentation.html file
cat > "$FOLDER_NAME/presentation.html" << 'EOF'
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>YOUR_TITLE_HERE - Aneesa Awaludin</title>
    <meta name="description" content="YOUR_DESCRIPTION_HERE" />
    <meta name="author" content="Aneesa Awaludin" />

    <link href="css/impress-demo.css" rel="stylesheet" />
    <link href="css/impress-common.css" rel="stylesheet" />

    <style>
        /* Custom styling for your presentation */
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'PT Serif', serif;
        }

        .slide {
            text-align: center;
            padding: 60px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            width: 900px;
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .main-title {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 20px;
            text-shadow: 3px 3px 6px rgba(102, 126, 234, 0.2);
        }

        .subtitle {
            font-size: 1.25em;
            color: #764ba2;
            font-style: italic;
            margin-top: 15px;
        }
    </style>

    <link rel="shortcut icon" href="favicon.png" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
</head>

<body class="impress-not-supported">
    <div class="fallback-message">
        <p>Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a
            simplified version of this presentation.</p>
        <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
    </div>

    <div id="impress" data-transition-duration="1000" data-width="1024" data-height="768" data-max-scale="3"
        data-min-scale="0" data-perspective="1000">

        <div id="title" class="step slide" data-x="0" data-y="0" data-rotate="0" data-scale="1">
            <div class="main-title">YOUR_TITLE_HERE</div>
            <div class="subtitle">Aneesa Awaludin</div>
        </div>

        <div id="content" class="step slide" data-x="0" data-y="800" data-rotate="0" data-scale="1">
            <div class="main-title">Your Content Here</div>
            <div class="subtitle">Add your presentation content</div>
        </div>

        <div id="thank-you" class="step slide" data-x="0" data-y="1600" data-rotate="0" data-scale="1">
            <div class="main-title">Thank you!</div>
        </div>
    </div>

    <script type="text/javascript" src="js/impress.js"></script>
    <script>
        impress().init();
    </script>
</body>
</html>
EOF

# Update the index.html file
sed -i.bak "s/YOUR_TITLE_HERE/$PRESENTATION_NAME/g" "$FOLDER_NAME/presentation.html"
sed -i.bak "s/YOUR_DESCRIPTION_HERE/Interactive presentation about $PRESENTATION_NAME/g" "$FOLDER_NAME/presentation.html"

# Create a simple index.html for the new presentation
cat > "$FOLDER_NAME/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$PRESENTATION_NAME - Aneesa Awaludin</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            min-height: 100vh;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            color: #333;
        }
        h1 {
            text-align: center;
            color: #667eea;
            margin-bottom: 30px;
        }
        .button {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            margin: 10px 5px;
            transition: background 0.3s ease;
        }
        .button:hover {
            background: #764ba2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>$PRESENTATION_NAME</h1>
        <p><strong>By: Aneesa Awaludin</strong></p>
        
        <h3>Quick Access:</h3>
        <a href="presentation.html" class="button">🚀 Launch Presentation</a>
        <a href="../" class="button">🏠 Back to All Presentations</a>

        <h3>Navigation Instructions:</h3>
        <ul>
            <li><strong>Arrow Keys:</strong> Navigate between slides</li>
            <li><strong>Space/Enter:</strong> Next slide</li>
            <li><strong>Shift + Arrow:</strong> Previous slide</li>
            <li><strong>ESC:</strong> Overview mode</li>
        </ul>
    </div>
</body>
</html>
EOF

# Create a README for the new presentation
cat > "$FOLDER_NAME/README.md" << EOF
# $PRESENTATION_NAME

An interactive presentation about $PRESENTATION_NAME created by Aneesa Awaludin using impress.js.

## 🚀 Quick Start

### Option 1: Online (GitHub Pages)
**Live Presentation:** \`https://aneesa.github.io/Impress/$FOLDER_NAME/\`

### Option 2: Local Server
\`\`\`bash
cd /path/to/Impress
python3 -m http.server 8000
\`\`\`
Then visit: \`http://localhost:8000/$FOLDER_NAME/\`

## 🎮 Navigation Controls

- **Arrow Keys:** Navigate between slides
- **Space/Enter:** Next slide
- **Shift + Arrow:** Previous slide
- **ESC:** Overview mode

## 📝 Next Steps

1. **Edit \`presentation.html\`** to add your content
2. **Add images** to the \`pics/\` folder
3. **Customize styling** in the CSS section
4. **Push to GitHub** to make it live

---

**Created with ❤️ by Aneesa Awaludin**
EOF

echo ""
echo "✅ Presentation '$PRESENTATION_NAME' created successfully!"
echo ""
echo "📁 Folder: $FOLDER_NAME"
echo "🌐 Local URL: http://localhost:8000/$FOLDER_NAME/"
echo "🌐 GitHub Pages URL: https://aneesa.github.io/Impress/$FOLDER_NAME/"
echo ""
echo "📝 Next steps:"
echo "1. Edit $FOLDER_NAME/presentation.html"
echo "2. Add your images to $FOLDER_NAME/pics/"
echo "3. Customize the styling and content"
echo "4. Push to GitHub to make it live"
echo "" 