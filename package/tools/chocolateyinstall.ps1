$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName           = 'mssyncframework21-corecomponents-kb2703853'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if([System.IntPtr]::Size -ne 4)
{
    $fileLocation = Join-Path $toolsDir 'Synchronization-KB2703853-v2.1-x64-ENU.msi'
    $checksum     = 'D06B13C04DFCC5FB9D3EDB64B4CB2C7D51E70E3214EA1107D149E525ACD04FEF6BE1F1DADBD96C877DE92B0F67CB230ECAEE6489105AFF08EEAB5EE2ECBE1421'
    $checksumType = 'sha512'
}
else
{
    $fileLocation = Join-Path $toolsDir 'Synchronization-KB2703853-v2.1-x86-ENU.msi'
    $checksum     = 'F0CCFEC6BFD0C32740A017E069F24B7D1014C97952327634F1C63251B334ADF3857240D17338C9B99A5ABEA843BEB8FBE967498F05EC6C318103F65F3DAADC46'
    $checksumType = 'sha512'
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  file          = $fileLocation
  softwareName  = 'mssyncframework21-corecomponents-kb2703853*'
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs