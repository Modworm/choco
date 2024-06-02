$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$installDir = "$env:ProgramFiles\rain" 

if (Test-Path $installDir) {
    Remove-Item -Path $installDir -Recurse -Force
    if (-not (Test-Path $installDir)) {
        Write-Host "Uninstallation completed successfully."
    } else {
        Write-Host "Failed to uninstall. Please check permissions and try again."
    }
} else {
    Write-Host "Installation directory not found. Skipping uninstallation."
}

