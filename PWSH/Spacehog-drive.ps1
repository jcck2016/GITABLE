# Function to get the top N folders by size
function Get-TopFolders {
    param (
        [string]$DriveLetter,
        [int]$TopN
    )
    $folders = Get-ChildItem -Path "$DriveLetter\" -Directory -Recurse | 
               Measure-Object -Property @{Expression={($_.PSIsContainer -and $_.FullName) -replace '\\$', ''}} -Sum -ErrorAction SilentlyContinue
    $totalSize = $folders.Sum
    $topFolders = $folders | Sort-Object -Property Length -Descending | Select-Object -First $TopN
    $topFolders | ForEach-Object {
        [PSCustomObject]@{
            Folder = $_.FullName
            SizeMB = [math]::Round($_.Length / 1MB, 2)
            Percentage = [math]::Round(($_.Length / $totalSize) * 100, 2)
        }
    }
}

# Function to get the top N files by size
function Get-TopFiles {
    param (
        [string]$DriveLetter,
        [int]$TopN
    )
    $files = Get-ChildItem -Path "$DriveLetter\" -File -Recurse | 
             Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue
    $totalSize = $files.Sum
    $topFiles = $files | Sort-Object -Property Length -Descending | Select-Object -First $TopN
    $topFiles | ForEach-Object {
        [PSCustomObject]@{
            File = $_.FullName
            SizeMB = [math]::Round($_.Length / 1MB, 2)
            Percentage = [math]::Round(($_.Length / $totalSize) * 100, 2)
        }
    }
}

# Main script
$driveLetter = "C:\temp"  # Change this to the drive letter you want to analyze
$topFolders = Get-TopFolders -DriveLetter $driveLetter -TopN 30
$topFiles = Get-TopFiles -DriveLetter $driveLetter -TopN 50

# Display results
Write-Output "Top 30 Folders by Size:"
$topFolders | Format-Table -AutoSize

Write-Output "`nTop 50 Files by Size:"
$topFiles | Format-Table -AutoSize

