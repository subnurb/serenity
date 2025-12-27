# Serenity Theme Packaging Script
# Creates a zip file with Unix-compatible forward slashes
# Files are placed directly at the zip root (no wrapper folder)

$ErrorActionPreference = "Stop"

$themeName = "serenity"
$distPath = Join-Path $PSScriptRoot "dist"
$zipPath = Join-Path $distPath "$themeName.zip"

# Ensure dist folder exists
if (-not (Test-Path $distPath)) {
    New-Item -ItemType Directory -Path $distPath -Force | Out-Null
}

# Remove existing zip if present
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Folders and files to include in the package (directly at zip root)
$includeItems = @(
    "assets",
    "config",
    "modules",
    "templates",
    "translations",
    "preview.png",
    "preview-mobile.png",
    "preview-tablet.png"
)

# Create a temporary directory for packaging
$tempDir = Join-Path $env:TEMP "serenity_package_$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Serenity Theme - Package Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "`nCopying theme files..." -ForegroundColor Yellow

foreach ($item in $includeItems) {
    $sourcePath = Join-Path $PSScriptRoot $item
    $destPath = Join-Path $tempDir $item

    if (Test-Path $sourcePath) {
        if ((Get-Item $sourcePath).PSIsContainer) {
            Copy-Item -Path $sourcePath -Destination $destPath -Recurse -Force
            $fileCount = (Get-ChildItem -Path $destPath -Recurse -File).Count
            Write-Host "  [OK] $item ($fileCount files)" -ForegroundColor Green
        } else {
            Copy-Item -Path $sourcePath -Destination $destPath -Force
            Write-Host "  [OK] $item" -ForegroundColor Green
        }
    } else {
        Write-Host "  [SKIP] $item (not found)" -ForegroundColor Yellow
    }
}

Write-Host "`nCreating zip archive..." -ForegroundColor Yellow

# Use .NET to create zip with forward slashes
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::Open($zipPath, 'Create')

# Add all files from temp directory directly to zip root
Get-ChildItem -Path $tempDir -Recurse -File | ForEach-Object {
    # Get relative path from temp directory (this becomes the zip entry path)
    $relativePath = $_.FullName.Substring($tempDir.Length + 1)
    # Convert backslashes to forward slashes for Unix compatibility
    $relativePath = $relativePath -replace '\\', '/'

    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
        $zip,
        $_.FullName,
        $relativePath,
        [System.IO.Compression.CompressionLevel]::Optimal
    ) | Out-Null
}

$zip.Dispose()

# Clean up temporary directory
Remove-Item -Path $tempDir -Recurse -Force

# Verify the package
if (Test-Path $zipPath) {
    $zipInfo = Get-Item $zipPath
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "Package created successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Location: $zipPath" -ForegroundColor White
    Write-Host "Size: $([math]::Round($zipInfo.Length / 1MB, 2)) MB" -ForegroundColor White

    # Show package contents summary
    Write-Host "`nPackage contents:" -ForegroundColor Cyan
    $zipRead = [System.IO.Compression.ZipFile]::OpenRead($zipPath)

    # Group by top-level folder/file
    $entries = $zipRead.Entries | Group-Object {
        $parts = $_.FullName.Split('/')
        if ($parts.Count -gt 1) { $parts[0] } else { $_.FullName }
    } | Sort-Object Name

    foreach ($group in $entries) {
        if ($group.Name) {
            if ($group.Count -eq 1 -and $group.Group[0].FullName -eq $group.Name) {
                # Single file at root
                Write-Host "  $($group.Name)" -ForegroundColor White
            } else {
                # Folder with files
                Write-Host "  $($group.Name)/ ($($group.Count) files)" -ForegroundColor White
            }
        }
    }

    Write-Host "`nPath format verification (first 5 entries):" -ForegroundColor Cyan
    $sampleEntries = $zipRead.Entries | Select-Object -First 5
    foreach ($entry in $sampleEntries) {
        if ($entry.FullName -match '\\') {
            Write-Host "  [WARN] $($entry.FullName) contains backslash!" -ForegroundColor Red
        } else {
            Write-Host "  [OK] $($entry.FullName)" -ForegroundColor Green
        }
    }

    $zipRead.Dispose()
} else {
    Write-Host "Error: Package creation failed!" -ForegroundColor Red
    exit 1
}
