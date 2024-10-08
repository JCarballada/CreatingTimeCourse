# Script to generate synthetic data in subfolders named data1, data2, and data3

# Set the main folder name
$mainFolder = "FindFileExercise"

# Determine the path for the main folder in the current directory
$rootDirectory = Join-Path -Path (Get-Location) -ChildPath $mainFolder

# Check if the main directory exists; if not, create it
if (-Not (Test-Path -Path $rootDirectory)) {
    New-Item -Path $rootDirectory -ItemType Directory | Out-Null
}

# Create subfolders
$subfolders = @("data1", "data2", "data3")
foreach ($subfolder in $subfolders) {
    $subfolderPath = Join-Path -Path $rootDirectory -ChildPath $subfolder
    if (-Not (Test-Path -Path $subfolderPath)) {
        New-Item -Path $subfolderPath -ItemType Directory | Out-Null
    }
    # Remove any existing files in the subfolder
    Remove-Item "$subfolderPath\*" -Force -Recurse -ErrorAction SilentlyContinue
}

# Function to create a random file
function Create-RandomFile {
    param (
        [string]$folderPath,
        [datetime]$minDate,
        [datetime]$maxDate
    )
    
    $letters = -join ((65..90) | Get-Random -Count 2 | ForEach-Object { [char]$_ })
    $numbers = -join ((0..9) | Get-Random -Count 3)
    $fileName = "PSCourse_${letters}_${numbers}.File"
    
    $fileSizeInKB = Get-Random -Minimum 10 -Maximum 3000
    $fileSizeInBytes = $fileSizeInKB * 1024
    
    $randomCreationDate = $minDate.AddSeconds((New-TimeSpan -Start $minDate -End $maxDate).TotalSeconds * (Get-Random -Minimum 0.0 -Maximum 1.0))
    
    $filePath = Join-Path -Path $folderPath -ChildPath $fileName
    "This is a synthetic file: $fileName" | Out-File -FilePath $filePath
    
    $randomContent = "X" * $fileSizeInBytes
    Add-Content -Path $filePath -Value $randomContent
    
    $file = Get-Item $filePath
    $file.CreationTime = $randomCreationDate
    $file.LastWriteTime = $randomCreationDate

    return $file
}

# Generate 99 random files from the last 10 years spread across the subfolders
$tenYearsAgo = (Get-Date).AddYears(-10)
$now = Get-Date
for ($i = 1; $i -le 99; $i++) {
    $targetFolder = Join-Path -Path $rootDirectory -ChildPath $subfolders[(($i - 1) % 3)]
    $file = Create-RandomFile -folderPath $targetFolder -minDate $tenYearsAgo -maxDate $now
    Write-Output "Created file: $($file.Name), Date: $($file.LastWriteTime)"
}

# Create a specific file with a creation date older than 1990
$fileOlderThan1990 = "PSCourse_" + (-join ((65..90) | Get-Random -Count 2 | ForEach-Object { [char]$_ })) + "_" + (-join ((0..9) | Get-Random -Count 3)) + ".File"
$filePathOlderThan1990 = Join-Path -Path (Join-Path -Path $rootDirectory -ChildPath $subfolders[1]) -ChildPath $fileOlderThan1990
"File created specifically with date older than 1990" | Out-File -FilePath $filePathOlderThan1990
Add-Content -Path $filePathOlderThan1990 -Value ("X" * (Get-Random -Minimum 10 -Maximum 3000) * 1024)
(Get-Item $filePathOlderThan1990).CreationTime = Get-Date "1989-12-31"
(Get-Item $filePathOlderThan1990).LastWriteTime = Get-Date "1989-12-31"

# Output the summary of created files
Write-Output "Synthetic data generated successfully in $rootDirectory."
Write-Output "Special file created:"
Write-Output "File older than 1990: $fileOlderThan1990 (in $($subfolders[1]))"

# Count files in each subfolder
foreach ($subfolder in $subfolders) {
    $subfolderPath = Join-Path -Path $rootDirectory -ChildPath $subfolder
    $fileCount = (Get-ChildItem -Path $subfolderPath -File).Count
    Write-Output "Files in $($subfolder): $fileCount"
}

# Find files older than 1990
$oldFiles = Get-ChildItem -Path $rootDirectory -File -Recurse | Where-Object { $_.CreationTime -lt (Get-Date "1990-01-01") }

# Display the results
if ($oldFiles) {
    Write-Output "Files older than 1990:"
    $oldFiles | ForEach-Object {
        Write-Output "File: $($_.Name), Created: $($_.CreationTime), Path: $($_.FullName)"
    }
} else {
    Write-Output "No files older than 1990 found."
}