$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$installDir = Join-Path -Path $env:ChocolateyInstall -ChildPath 'lib'
$installDir = Join-Path -Path $installDir -ChildPath $packageName

if (Test-Path $installDir) {
    Write-Host "Removing $installDir"
    Remove-Item -Force -Recurse $installDir
    Write-Host "$installDir has been uninstalled."
} else {
    Write-Host "$installDir not found, nothing to uninstall."
}