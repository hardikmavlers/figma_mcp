# PowerShell script to download images from Figma
# Images: image one, image two, image three

$fileKey = "PGECA0PxOBEDcs2NDqGMWj"

# Image mappings from Figma
$images = @(
    @{ NodeId = "1:51"; Name = "image-one.png"; DisplayName = "image one" },
    @{ NodeId = "1:52"; Name = "image-two.png"; DisplayName = "image two" },
    @{ NodeId = "1:53"; Name = "image-three.png"; DisplayName = "image three" }
)

Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "Figma Image Downloader" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# Check if user has Figma token in environment
$figmaToken = $env:FIGMA_TOKEN

if (-not $figmaToken) {
    Write-Host "ERROR: Figma Personal Access Token not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please follow these steps:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://www.figma.com/developers/api#access-tokens" -ForegroundColor White
    Write-Host "2. Log in to your Figma account" -ForegroundColor White
    Write-Host "3. Click 'Get personal access token' or 'Create new token'" -ForegroundColor White
    Write-Host "4. Copy the generated token" -ForegroundColor White
    Write-Host ""
    Write-Host "Then run this command to set your token:" -ForegroundColor Yellow
    Write-Host '   $env:FIGMA_TOKEN = "your-token-here"' -ForegroundColor Green
    Write-Host ""
    Write-Host "OR temporarily provide it now:" -ForegroundColor Yellow
    $figmaToken = Read-Host "Enter your Figma token (or press Enter to exit)"
    
    if (-not $figmaToken) {
        Write-Host "Exiting..." -ForegroundColor Red
        exit 1
    }
}

$headers = @{
    "X-Figma-Token" = $figmaToken
}

# Build the API URL with node IDs
$nodeIds = ($images | ForEach-Object { $_.NodeId }) -join ","
$apiUrl = "https://api.figma.com/v1/images/$fileKey`?ids=$nodeIds&format=png&scale=1"

Write-Host "Fetching image URLs from Figma API..." -ForegroundColor Cyan
Write-Host ""

try {
    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get -ErrorAction Stop
    
    if ($response.err) {
        Write-Host "ERROR: $($response.err)" -ForegroundColor Red
        exit 1
    }
    
    # Check if we got images
    if (-not $response.images) {
        Write-Host "ERROR: No images returned from Figma API" -ForegroundColor Red
        exit 1
    }
    
    # Download each image
    $successCount = 0
    foreach ($image in $images) {
        $nodeId = $image.NodeId
        $fileName = $image.Name
        $displayName = $image.DisplayName
        $imageUrl = $response.images.$nodeId
        
        if ($imageUrl) {
            Write-Host "[$($successCount + 1)/3] Downloading '$displayName' → $fileName" -ForegroundColor Yellow
            $outputPath = Join-Path "assets" $fileName
            
            try {
                Invoke-WebRequest -Uri $imageUrl -OutFile $outputPath -ErrorAction Stop
                $fileSize = (Get-Item $outputPath).Length
                $fileSizeKB = [math]::Round($fileSize / 1KB, 2)
                Write-Host "      ✓ Saved successfully ($fileSizeKB KB)" -ForegroundColor Green
                $successCount++
            }
            catch {
                Write-Host "      ✗ Failed to download: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
        else {
            Write-Host "[$($successCount + 1)/3] ✗ Could not get URL for '$displayName'" -ForegroundColor Red
        }
        Write-Host ""
    }
    
    Write-Host "=" * 60 -ForegroundColor Cyan
    if ($successCount -eq $images.Count) {
        Write-Host "SUCCESS! All $successCount images downloaded!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Yellow
        Write-Host "1. Open index.html in your browser to verify" -ForegroundColor White
        Write-Host "2. Run: git add assets/" -ForegroundColor White
        Write-Host "3. Run: git commit -m 'Add Figma images'" -ForegroundColor White
        Write-Host "4. Run: git push origin main" -ForegroundColor White
    }
    else {
        Write-Host "Downloaded $successCount out of $($images.Count) images" -ForegroundColor Yellow
    }
    Write-Host "=" * 60 -ForegroundColor Cyan
    
}
catch {
    Write-Host "ERROR: Failed to fetch from Figma API" -ForegroundColor Red
    Write-Host "Details: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Common issues:" -ForegroundColor Yellow
    Write-Host "- Invalid or expired token" -ForegroundColor White
    Write-Host "- No access to the Figma file" -ForegroundColor White
    Write-Host "- Network connectivity issues" -ForegroundColor White
    exit 1
}

