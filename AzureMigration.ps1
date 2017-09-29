param(
    [string]$azureMigrationCorePowershellUrl = "https://opbuildstoragesandbox2.blob.core.windows.net/azure-migration/AzureMigrationCore.ps1",
    [string]$parameters
)
# Main
$errorActionPreference = 'Stop'

# Step-1 Download buildcore script to local
echo "download azure migration core script to local with source url: $azureMigrationCorePowershellUrl"
$workingRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

$azureMigrationCoreDestinationFolder = "$workingRoot\.migrationtemp"
if(!(Test-Path "$azureMigrationCoreDestinationFolder"))
{
    New-Item "$azureMigrationCoreDestinationFolder" -ItemType Directory
}
$azureMigrationCoreDestination = "$azureMigrationCoreDestinationFolder\AzureMigrationCore.ps1"
Invoke-WebRequest $azureMigrationCorePowershellUrl -OutFile "$azureMigrationCoreDestination"

# Step-2: Run build core
echo "run auzre migration core script with parameters: $parameters"
& "$azureMigrationCoreDestination" "$parameters"
exit $LASTEXITCODE