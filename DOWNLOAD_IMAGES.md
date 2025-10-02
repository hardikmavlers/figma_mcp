# How to Download Images from Figma

## Image Information from Figma Design

Based on the [Figma design](https://www.figma.com/design/PGECA0PxOBEDcs2NDqGMWj/Layout-6?node-id=1-50&t=eDfren7YRnhgGrvY-4), here are the three images needed:

| Image File | Node ID | Dimensions | Image Reference |
|-----------|---------|------------|-----------------|
| h44.png | 1:51 | 309.61px × 350.55px | f79884d774711f0b2b572af6ba765083d74f149c |
| h46.png | 1:52 | 209px × 182px | 8cef43cf58a845ea9a6d956df7dd8903e044c310 |
| h45.png | 1:53 | 400px × 474px | ba2bd02607cbd88f4209b0d55b385384d8956277 |

---

## Method 1: Manual Download from Figma (RECOMMENDED)

This is the easiest method and doesn't require any API tokens.

### Steps:

1. **Open the Figma design** in your browser:
   - Go to: https://www.figma.com/design/PGECA0PxOBEDcs2NDqGMWj/Layout-6?node-id=1-50&t=eDfren7YRnhgGrvY-4

2. **Select the first image**:
   - In the left panel (Layers), find and click on **"Link → h44.png"**
   - In the right panel, scroll down to find the **"Export"** section
   - Click the **"+"** button if no export settings exist
   - Set format to **PNG** and scale to **1x**
   - Click **"Export Link → h44.png"** button
   - Save the file as `h44.png` to the `assets/` folder

3. **Repeat for the other two images**:
   - Select **"Link → h46.png"** → Export as `h46.png`
   - Select **"Link → h45.png"** → Export as `h45.png`

4. **Place all three files in the assets folder**:
   ```
   figma_mcp/
   └── assets/
       ├── h44.png  ✓
       ├── h45.png  ✓
       └── h46.png  ✓
   ```

---

## Method 2: Using Figma API (ADVANCED)

If you prefer to automate the download, you can use the Figma API.

### Prerequisites:
- Figma Personal Access Token
  - Get it from: https://www.figma.com/developers/api#access-tokens
  - Click "Get personal access token" and generate a new token

### Using the PowerShell Script:

1. **Edit the script**:
   - Open `download_images.ps1`
   - Replace `YOUR_FIGMA_TOKEN_HERE` with your actual Figma token

2. **Run the script**:
   ```powershell
   .\download_images.ps1
   ```

The script will:
- Fetch image URLs from the Figma API
- Download all three images
- Save them to the `assets/` folder

---

## Method 3: Using curl (Alternative)

If you have curl installed and a Figma token:

```bash
# Set your token
$TOKEN = "YOUR_FIGMA_TOKEN"

# Get image URLs
curl -H "X-Figma-Token: $TOKEN" "https://api.figma.com/v1/images/PGECA0PxOBEDcs2NDqGMWj?ids=1:51,1:52,1:53&format=png"

# Then download each image URL manually
```

---

## After Downloading

Once you have all three images in the `assets/` folder:

1. **Open index.html** in your browser to verify the images display correctly
2. **Commit and push to GitHub**:
   ```powershell
   git add assets/
   git commit -m "Add actual images from Figma design"
   git push origin main
   ```

---

## Troubleshooting

**Images not displaying?**
- Make sure filenames are exactly: `h44.png`, `h46.png`, `h45.png` (lowercase)
- Check that files are in the `assets/` folder (not a subfolder)
- Verify the images are valid PNG files (not SVG or text files)

**Can't export from Figma?**
- Make sure you have view access to the Figma file
- Try opening in Figma Desktop app instead of browser
- Check if you're logged into Figma

---

**Need help?** Check the main [README.md](README.md) or [SETUP.md](SETUP.md) for more information.

