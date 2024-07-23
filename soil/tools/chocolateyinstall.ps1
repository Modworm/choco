$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$tempDir = Join-Path $env:TEMP "chocolatey\$packageName"

$zipUrl = 'https://modworm.com/soil_v2.0.0_windows.zip'
$zipChecksum = '5ff7076ecc2fd8775e9ec18fd9bd19edb46e76f300616ff9615ef508b8bfeaeb'
$zipChecksumType = 'sha256'  

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

Write-Host "Downloading $zipUrl to $tempDir\$packageName.zip"
$zipPath = Join-Path $tempDir "$packageName.zip"
Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $zipUrl -Checksum $zipChecksum -ChecksumType $zipChecksumType

Write-Host "Extracting $tempDir\$packageName.zip to $tempDir"
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $tempDir

$fileLocation = Join-Path $tempDir 'soil\soil.exe'

$destination = Join-Path $env:ChocolateyInstall 'bin\soil.exe'

Write-Host "Copying $fileLocation to $destination"
Copy-Item -Path $fileLocation -Destination $destination -Force

Write-Host "Cleaning up temporary files in $tempDir"
Remove-Item -Path "$tempDir" -Recurse -Force

Write-Host "$packageName has been installed to $destination"