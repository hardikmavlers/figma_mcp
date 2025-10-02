# Setup Instructions

## Download Image Assets from Figma

To complete the pixel-perfect implementation, you need to download three images from the Figma design.

### Step 1: Access the Figma Design
Visit: [https://www.figma.com/design/PGECA0PxOBEDcs2NDqGMWj/Layout-6?node-id=1-50](https://www.figma.com/design/PGECA0PxOBEDcs2NDqGMWj/Layout-6?node-id=1-50&t=eDfren7YRnhgGrvY-4)

### Step 2: Export Images

#### Method 1: Manual Export from Figma
1. Open the Figma file in your browser or Figma desktop app
2. Select each image layer one by one:
   - **Layer: "Link → h44.png"**
   - **Layer: "Link → h45.png"**
   - **Layer: "Link → h46.png"**
3. For each layer:
   - Right-click → Export
   - Format: PNG
   - Size: 1x (original size)
   - Export as filename: `h44.png`, `h45.png`, `h46.png`

#### Method 2: Using Figma's Image Export API
The images can be accessed via the Figma API with these reference IDs:
- **h44.png**: Image Ref `f79884d774711f0b2b572af6ba765083d74f149c`
- **h45.png**: Image Ref `ba2bd02607cbd88f4209b0d55b385384d8956277`
- **h46.png**: Image Ref `8cef43cf58a845ea9a6d956df7dd8903e044c310`

### Step 3: Place Images in Assets Folder
After downloading, place the three images in the `assets/` folder:
```
figma_mcp/
└── assets/
    ├── h44.png  (309.61px × 350.55px)
    ├── h45.png  (400px × 474px)
    └── h46.png  (209px × 182px)
```

### Step 4: Verify the Implementation
Open `index.html` in your browser. You should see:
- Three property images arranged in a layered gallery layout
- "Why You Should Work With Us" heading
- Description text
- Four feature items with checkmark icons
- "Learn More" button with arrow icon

## Image Specifications

| Image | Dimensions | Position | File |
|-------|-----------|----------|------|
| Image 1 | 309.61px × 350.55px | Top-left | h44.png |
| Image 2 | 209px × 182px | Bottom-left | h46.png |
| Image 3 | 400px × 474px | Center-right | h45.png |

## Alternative: Use Placeholder Images
If you can't access the Figma file, you can use placeholder images temporarily:
1. Visit [placeholder.com](https://placeholder.com) or [unsplash.com](https://unsplash.com)
2. Download property/real estate images with the specified dimensions
3. Rename them to h44.png, h45.png, h46.png
4. Place them in the `assets/` folder

## Troubleshooting

**Issue**: Images not loading
- Check that image filenames are exactly: `h44.png`, `h45.png`, `h46.png`
- Verify images are in the `assets/` folder
- Check browser console for 404 errors

**Issue**: Layout looks incorrect
- Make sure you're viewing on a screen at least 1280px wide
- Try zooming out if the layout is cut off
- Check that all CSS is loading correctly

---

For more information, see the main [README.md](README.md)