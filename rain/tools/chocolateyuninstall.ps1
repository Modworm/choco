$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$installDir = Join-Path $env:ChocolateyInstall 'bin'
$exePath = Join-Path $installDir 'rain.exe'

if (Test-Path $exePath) {
    Write-Host "Removing $exePath"
    Remove-Item $exePath -Force
    Write-Host "$exePath has been removed"
} else {
    Write-Host "$exePath not found, nothing to remove"
}