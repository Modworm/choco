$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$installDir = Join-Path $env:ChocolateyInstall 'lib' $packageName

if (Test-Path $installDir) {
    Write-Host "Removing $installDir"
    Remove-Item -Force -Recurse $installDir
    Write-Host "$installDir has been uninstalled."
} else {
    Write-Host "$installDir not found, nothing to uninstall."
}