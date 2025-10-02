# Quick Start Guide - Download Figma Images

## Step 1: Get Your Figma Token

1. Visit: **https://www.figma.com/developers/api#access-tokens**
2. Log in to your Figma account
3. Click **"Get personal access token"** or **"Create new token"**
4. Copy the generated token (it looks like: `figd_xxxx...`)

## Step 2: Set Your Token in PowerShell

Open PowerShell in this directory and run:

```powershell
$env:FIGMA_TOKEN = "paste-your-token-here"
```

## Step 3: Run the Download Script

```powershell
.\download_figma_images.ps1
```

The script will:
- ✓ Connect to Figma API
- ✓ Download **image one** (309.61px × 350.55px) → `assets/image-one.png`
- ✓ Download **image two** (209px × 182px) → `assets/image-two.png`
- ✓ Download **image three** (400px × 474px) → `assets/image-three.png`

## Step 4: Verify the Images

Open `index.html` in your browser to see the section with all images loaded.

## Step 5: Commit and Push to GitHub

```powershell
git add assets/
git commit -m "Add Figma images (image one, two, three)"
git push origin main
```

---

## Alternative: Manual Download

If you prefer not to use the API:

1. Open https://www.figma.com/design/PGECA0PxOBEDcs2NDqGMWj/Layout-6?node-id=1-50
2. Select **"image one"** layer in the left panel
3. In the right panel, scroll to **Export** section
4. Click **"+"** to add export settings (if needed)
5. Set to **PNG, 1x** scale
6. Click **"Export image one"**
7. Save as `image-one.png` in the `assets/` folder
8. Repeat for **"image two"** → `image-two.png`
9. Repeat for **"image three"** → `image-three.png`

---

## Troubleshooting

**"Invalid token" error:**
- Make sure you copied the entire token
- Token should start with `figd_`
- Try generating a new token

**"No access to file" error:**
- Make sure you have view access to the Figma file
- Try opening the Figma link in your browser first

**Images not downloading:**
- Check your internet connection
- Verify the Figma file URL is correct
- Try the manual download method

---

**Need help?** Check [DOWNLOAD_IMAGES.md](DOWNLOAD_IMAGES.md) for more details.

