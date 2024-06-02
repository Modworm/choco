$ErrorActionPreference = 'Stop'

$packageName   = $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "chocolatey\$packageName"

$zipUrl        = 'https://modworm.com/rain_v1.0.0_windows.zip'

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
Invoke-WebRequest -Uri $zipUrl -OutFile "$tempDir\$packageName.zip"

Expand-Archive -Path "$tempDir\$packageName.zip" -DestinationPath $tempDir -Force

$fileLocation = Join-Path $tempDir 'rain.exe'

$packageArgs = @{
    packageName   = $packageName
    softwareName  = 'rain'
    fileType      = 'exe'
    file          = $fileLocation
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Path "$tempDir" -Recurse -Force

