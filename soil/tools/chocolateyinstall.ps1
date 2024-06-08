$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "chocolatey\$packageName"

$zipUrl = 'https://modworm.com/soil_v1.0.0_windows.zip'

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

Write-Host "Downloading $zipUrl to $tempDir\$packageName.zip"
Invoke-WebRequest -Uri $zipUrl -OutFile "$tempDir\$packageName.zip"

Write-Host "Extracting $tempDir\$packageName.zip to $tempDir"
Expand-Archive -Path "$tempDir\$packageName.zip" -DestinationPath $tempDir -Force

$fileLocation = Join-Path $tempDir 'soil\soil.exe'

$destination = Join-Path $env:ChocolateyInstall 'bin\soil.exe'

Write-Host "Copying $fileLocation to $destination"
Copy-Item -Path $fileLocation -Destination $destination -Force

Write-Host "Cleaning up temporary files in $tempDir"
Remove-Item -Path "$tempDir" -Recurse -Force

Write-Host "$packageName has been installed to $destination"