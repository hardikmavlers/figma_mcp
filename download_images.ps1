# PowerShell script to download images from Figma
# Note: You need a Figma Personal Access Token to use this script

$fileKey = "PGECA0PxOBEDcs2NDqGMWj"
$nodeIds = @("1:51", "1:52", "1:53")
$outputNames = @("h44.png", "h46.png", "h45.png")

# You need to set your Figma token here
# Get it from: https://www.figma.com/developers/api#access-tokens
$figmaToken = "YOUR_FIGMA_TOKEN_HERE"

if ($figmaToken -eq "YOUR_FIGMA_TOKEN_HERE") {
    Write-Host "ERROR: Please set your Figma Personal Access Token in this script" -ForegroundColor Red
    Write-Host ""
    Write-Host "To get your token:" -ForegroundColor Yellow
    Write-Host "1. Go to https://www.figma.com/developers/api#access-tokens"
    Write-Host "2. Click on 'Get personal access token'"
    Write-Host "3. Generate a new token"
    Write-Host "4. Replace 'YOUR_FIGMA_TOKEN_HERE' in this script with your token"
    Write-Host ""
    exit 1
}

$headers = @{
    "X-Figma-Token" = $figmaToken
}

# Get image URLs from Figma API
$imageIdsParam = ($nodeIds -join ",")
$apiUrl = "https://api.figma.com/v1/images/$fileKey`?ids=$imageIdsParam&format=png"

Write-Host "Fetching image URLs from Figma..." -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get
    
    if ($response.err) {
        Write-Host "ERROR: $($response.err)" -ForegroundColor Red
        exit 1
    }
    
    # Download each image
    for ($i = 0; $i -lt $nodeIds.Length; $i++) {
        $nodeId = $nodeIds[$i]
        $outputName = $outputNames[$i]
        $imageUrl = $response.images.$nodeId
        
        if ($imageUrl) {
            Write-Host "Downloading $outputName..." -ForegroundColor Green
            $outputPath = Join-Path "assets" $outputName
            Invoke-WebRequest -Uri $imageUrl -OutFile $outputPath
            Write-Host "  ✓ Saved to $outputPath" -ForegroundColor Green
        } else {
            Write-Host "ERROR: Could not get URL for $outputName" -ForegroundColor Red
        }
    }
    
    Write-Host ""
    Write-Host "All images downloaded successfully!" -ForegroundColor Green
    
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

