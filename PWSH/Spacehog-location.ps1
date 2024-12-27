# Function to get the top N folders by size
function Get-TopFolders {
    param (
        [string]$Path,
        [int]$TopN
    )
    $folders = Get-ChildItem -Path $Path -Directory -Recurse | 
               ForEach-Object {
                   $folderSize = (Get-ChildItem -Path $_.FullName -File -Recurse | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
                   $_ | Add-Member -MemberType NoteProperty -Name Size -Value $folderSize -PassThru
               }
    $totalSize = (Get-ChildItem -Path $Path -File -Recurse | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
    $topFolders = $folders | Sort-Object -Property Size -Descending | Select-Object -First $TopN
    $topFolders | ForEach-Object {
        [PSCustomObject]@{
            Folder = $_.FullName
            SizeMB = [math]::Round($_.Size / 1MB, 2)
            Percentage = [math]::Round(($_.Size / $totalSize) * 100, 2)
        }
    }
}

# Function to get the top N files by size
function Get-TopFiles {
    param (
        [string]$Path,
        [int]$TopN
    )
    $files = Get-ChildItem -Path $Path -File -Recurse
    $totalSize = ($files | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
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
$path = "c:\temp"  # Change this to the path you want to analyze
$topFolders = Get-TopFolders -Path $path -TopN 30
$topFiles = Get-TopFiles -Path $path -TopN 50

# Display results
Write-Output "Top 30 Folders by Size:"
$topFolders | Format-Table -AutoSize

Write-Output "`nTop 50 Files by Size:"
$topFiles | Format-Table -AutoSize