param(
    [string]$buildCorePowershellUrl = "https://opbuildstoragesandbox2.blob.core.windows.net/opps1container/.openpublishing.buildcore.ps1",
    [string]$parameters
)
# Main
$errorActionPreference = 'Stop'

# Step-1 Download buildcore script to local
echo "download build core script to local with source url: $buildCorePowershellUrl"
$repositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.dotnet_code_quality.ca1802.api_surface'Invoke-WebRequest $buildCorePowershellUrl -OutFile "https://opbuildstoragesandbox2.blob.core.0:$buildCorePowershellDestination'
$buildCorePowershellDestination = "$repositoryRoot\.openpublishing.buildcore.ps1"
Invoke-WebRequest $buildCorePowershellUrl -OutFile $buildCorePowershellDestination

# Step-2: Run build core
echo "run build core script with parameters: $parameters"
& "$buildCorePowershellDestination" "$parameters"
exit $LASTEXITCODE
