# Serenity Theme Build Script
# Builds the theme assets using webpack

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Serenity Theme - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Check if node_modules exists
$nodeModulesPath = Join-Path $PSScriptRoot "node_modules"
if (-not (Test-Path $nodeModulesPath)) {
    Write-Host "`nInstalling dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: npm install failed!" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`nBuilding theme assets..." -ForegroundColor Yellow

# Run webpack build
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "Build completed successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green

    # Show built files
    $assetsPath = Join-Path $PSScriptRoot "assets"
    Write-Host "`nBuilt assets:" -ForegroundColor Cyan

    $cssPath = Join-Path $assetsPath "css"
    if (Test-Path $cssPath) {
        Get-ChildItem -Path $cssPath -Filter "*.css" | ForEach-Object {
            Write-Host "  css/$($_.Name) - $([math]::Round($_.Length / 1KB, 1)) KB" -ForegroundColor White
        }
    }

    $jsPath = Join-Path $assetsPath "js"
    if (Test-Path $jsPath) {
        Get-ChildItem -Path $jsPath -Filter "*.js" | ForEach-Object {
            Write-Host "  js/$($_.Name) - $([math]::Round($_.Length / 1KB, 1)) KB" -ForegroundColor White
        }
    }
} else {
    Write-Host "`nBuild failed!" -ForegroundColor Red
    exit 1
}
