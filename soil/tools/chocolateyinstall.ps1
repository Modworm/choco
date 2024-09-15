$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$zipUrl = 'https://modworm.com/soil_v1.0.0_windows.zip'
$zipChecksum = '42770dfdf73cf6d5fb166d73cde4cf0d8cba1b9f33c7a4b8fb33805b29cade1d'
$zipChecksumType = 'sha256'  

$installDir = Join-Path $env:ChocolateyInstall 'lib' $packageName

Install-ChocolateyZipPackage -PackageName $packageName -Url $zipUrl -UnzipLocation $installDir -Checksum $zipChecksum -ChecksumType $zipChecksumType