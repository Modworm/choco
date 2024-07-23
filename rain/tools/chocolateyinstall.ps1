$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$tempDir = Join-Path $env:TEMP "chocolatey\$packageName"

$zipUrl = 'https://modworm.com/rain_v1.0.0_windows.zip'
$zipChecksum = '5c2b678604a7fa3fdcf36428f28d6dbe4a8813c5f9f4ea2f2d6385bc49f56e1e'
$zipChecksumType = 'sha256'

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

Write-Host "Downloading $zipUrl to $tempDir\$packageName.zip"
$zipPath = Join-Path $tempDir "$packageName.zip"
Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $zipUrl -Checksum $zipChecksum -ChecksumType $zipChecksumType

Write-Host "Extracting $tempDir\$packageName.zip to $tempDir"
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $tempDir


$fileLocation = Join-Path $tempDir 'rain\rain.exe'

$destination = Join-Path $env:ChocolateyInstall 'bin\rain.exe'

Write-Host "Copying $fileLocation to $destination"
Copy-Item -Path $fileLocation -Destination $destination -Force

Write-Host "Cleaning up temporary files in $tempDir"
Remove-Item -Path "$tempDir" -Recurse -Force

Write-Host "$packageName has been installed to $destination"