$ErrorActionPreference = 'Stop'
$ProgressPreference = "SilentlyContinue"
$ARTIFACTS = Resolve-Path -Path .
$REPO = "InstallerPlugin"

# build plugin . . .
Write-Host "Build plugin . . ."
Get-ChildItem -Path $ARTIFACTS
Set-Location -Path $REPO
Start-Process -FilePath "./build.bat" -Wait -NoNewWindow

# Move plugin to artifacts
Write-Host "Move plugin to artifacts . . ."
Copy-Item -Path "./plugin.rbxmx" -Destination "$ARTIFACTS/plugin.rbxmx"

# exit
Write-Host "Builds Complete"
exit 0