$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$zipUrl = 'https://modworm.com/rain_v1.0.0_windows.zip'
$zipChecksum = '5c2b678604a7fa3fdcf36428f28d6dbe4a8813c5f9f4ea2f2d6385bc49f56e1e'
$zipChecksumType = 'sha256'

$installDir = Join-Path -Path $env:ChocolateyInstall -ChildPath 'lib'
$installDir = Join-Path -Path $installDir -ChildPath $packageName

Install-ChocolateyZipPackage -PackageName $packageName -Url $zipUrl -UnzipLocation $installDir -Checksum $zipChecksum -ChecksumType $zipChecksumType