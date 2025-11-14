Write-Host "=== Adding PATH entries for CURRENT USER ==="

# Пути, которые нужно добавить
$phpPath   = "C:\php"
$rustPath  = "$env:USERPROFILE\.cargo\bin"
$rubyPath  = "C:\Ruby33-x64\bin"

$pathsToAdd = @($phpPath, $rustPath, $rubyPath)

# Получаем USER PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")

function Add-ToUserPath {
    param(
        [string]$current,
        [string]$new
    )

    $parts = $current -split ";"

    if ($parts -contains $new) {
        Write-Host "[SKIP] $new already in USER PATH"
        return $current
    }

    Write-Host "[ADD]  $new"
    return "$current;$new"
}

# Обновляем USER PATH
$newUserPath = $userPath
foreach ($p in $pathsToAdd) {
    if (Test-Path $p) {
        $newUserPath = Add-ToUserPath $newUserPath $p
    } else {
        Write-Host "[WARN] Path does not exist: $p"
    }
}

[Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")

# Обновляем PATH текущей PowerShell-сессии
foreach ($p in $pathsToAdd) {
    if (-not ($env:PATH -split ";" | ForEach-Object { $_.Trim() } | Where-Object { $_ -eq $p })) {
        $env:PATH += ";$p"
        Write-Host "[SESSION] Added to current shell: $p"
    }
}

Write-Host "=== DONE ==="
Write-Host "Current session PATH:"
$env:PATH