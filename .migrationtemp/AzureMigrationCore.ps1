param(
    [string]$parameters
)

$workingDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$repositoryRoot = Split-Path -Parent $workingDirectory
$packagesDirectory = "$workingDirectory\packages"

$systemDefaultVariables = @{
    AzureMigrationToolContainerUrl = "https://opbuildstoragesandbox2.blob.core.windows.net/azure-migration"
    SourceFolder = $repositoryRoot;
    OutputFolder = $repositoryRoot;
    LogOutputFolder = "$repositoryRoot\log";
    DownloadNugetExeTimeOutInSeconds= 300;
    DownloadNugetConfigTimeOutInSeconds= 30;
    DocumentUriPrefix = "https://docs.microsoft.com"
}

Function ConsoleErrorAndExit([string]$message, [int]$exitCode)
{
    Write-Host -ForegroundColor Red $message
    return $exitCode
}

function Write-HostWithTimestamp([string]$output)
{
    Write-Host -NoNewline -ForegroundColor Magenta "[$(((get-date).ToUniversalTime()).ToString("HH:mm:ss.ffffffZ"))]: "
    Write-Host $output
}

Filter timestamp
{
    if (![string]::IsNullOrEmpty($_) -and ![string]::IsNullOrWhiteSpace($_))
    {
        Write-Host -NoNewline -ForegroundColor Magenta "[$(((get-date).ToUniversalTime()).ToString("HH:mm:ss.ffffffZ"))]: "
    }

    $_
}

Function GetValueFromVariableName([string]$variableValue, [string]$defaultStringValue)
{
    if([string]::IsNullOrEmpty($variableValue))
    {
        $variableValue = $defaultStringValue
    }
    return $variableValue
}

Function ParseBoolValue([string]$variableName, [string]$stringValue, [bool]$defaultBoolValue)
{
    if([string]::IsNullOrEmpty($stringValue))
    {
        return $defaultBoolValue
    }

    try
    {
        $parsedBoolValue = [System.Convert]::ToBoolean($stringValue)
    }
    catch
    {
        Write-Error "variable $variableName does not have a valid bool value: $stringValue. Exception: $($_.Exception.Message)"
    }

    return $parsedBoolValue
}

Function ParseParameters([string]$parameters)
{
    if([string]::IsNullOrEmpty($parameters))
    {
        return
    }

    $parameterPortions = $parameters.Split(';')
    foreach ($parameterPortion in $parameterPortions)
    {
        $keyValuePair = $parameterPortion.Split('=')
        if ($keyValuePair.Length -eq 2)
        {
            Set-Variable -Name $keyValuePair[0] -Value $keyValuePair[1] -Scope "Script" -Force
            Write-Host "Create script scope variable with input $keyValuePair"
        }
        else
        {
            Write-Host "Invalid variable with input $keyValuePair. Ignore it."
        }
    }
}

Function IsPathExists([string]$path)
{
    return Test-Path $path
}

Function CreateFolderIfNotExists([string]$folder)
{
    if(!(Test-Path "$folder"))
    {
        New-Item "$folder" -ItemType Directory
    }
}

Function IsNullOrEmptyValue([string]$value)
{
    if([String]::IsNullOrEmpty($value))
    {
        return $true
    }
    return $false
}

Function RetryCommand
{
    param (
        [Parameter(Mandatory=$true)][string]$command,
        [Parameter(Mandatory=$true)][hashtable]$args,
        [Parameter(Mandatory=$false)][int]$maxRetryCount = $systemDefaultVariables.DefaultMaxRetryCount,
        [Parameter(Mandatory=$false)][ValidateScript({$_ -ge 0})][int]$retryIncrementalIntervalInSeconds = 10
    )

    # Setting ErrorAction to Stop is important. This ensures any errors that occur in the command are
    # treated as terminating errors, and will be caught by the catch block.
    $args.ErrorAction = "Stop"

    $currentRetryIteration = 1
    $retryIntervalInSeconds = 0

    Write-HostWithTimestamp ("Start to run command [{0}] with args [{1}]." -f $command, $($args | Out-String))
    do{
        try
        {
            Write-HostWithTimestamp "Calling iteration $currentRetryIteration"
            & $command @args

            Write-HostWithTimestamp "Command ['$command'] succeeded at iteration $currentRetryIteration."
            return
        }
        Catch
        {
            Write-HostWithTimestamp "Calling iteration $currentRetryIteration failed, exception: '$($_.Exception.Message)'"
        }

        if ($currentRetryIteration -ne $maxRetryCount)
        {
            $retryIntervalInSeconds += $retryIncrementalIntervalInSeconds
            Write-HostWithTimestamp "Command ['$command'] failed. Retrying in $retryIntervalInSeconds seconds."
            Start-Sleep -Seconds $retryIntervalInSeconds
        }
    } while (++$currentRetryIteration -le $maxRetryCount)

    Write-HostWithTimestamp "Command ['$command'] failed. Maybe the network issues, please retry the build later."
    exit 1
}

Function DownloadFile([string]$source, [string]$destination, [bool]$forceDownload, [int]$timeoutSec = -1)
{
    if($forceDownload -or !(IsPathExists($destination)))
    {
        Write-Host "Download file to $destination from $source with force: $forceDownload"
        $destinationFolder = Split-Path -Parent $destination
        CreateFolderIfNotExists($destinationFolder)
        if ($timeoutSec -lt 0)
        {
            RetryCommand -Command 'Invoke-WebRequest' -Args @{ Uri = $source; OutFile = $destination; }
        }
        else
        {
            RetryCommand -Command 'Invoke-WebRequest' -Args @{ Uri = $source; OutFile = $destination; TimeoutSec = $timeoutSec }
        }
    }
}

echo "Default system value:" $systemDefaultVariables | timestamp
echo "Parse parameters $parameters" | timestamp
ParseParameters($parameters)

# Download azure migration tool
$AzureMigrationToolContainerUrl = GetValueFromVariableName($AzureMigrationToolContainerUrl) ($systemDefaultVariables.AzureMigrationToolContainerUrl)
$AzureMarkdownRewriterToolSource = "$AzureMigrationToolContainerUrl/AzureMarkdownRewriterTool.zip"
$AzureMarkdownRewriterToolDestination = "$workingDirectory\AzureMarkdownRewriterTool.zip"
DownloadFile($AzureMarkdownRewriterToolSource) ($AzureMarkdownRewriterToolDestination) ($true)
$AzureMarkdownRewriterToolUnzipFolder = "$workingDirectory\AzureMarkdownRewriterTool"
if((Test-Path "$AzureMarkdownRewriterToolUnzipFolder"))
{
    Remove-Item $AzureMarkdownRewriterToolUnzipFolder -Force -Recurse
}

# Unzip the tool to specified folder
Add-type -AssemblyName "System.IO.Compression.FileSystem"
[System.IO.Compression.ZipFile]::ExtractToDirectory($AzureMarkdownRewriterToolDestination, $AzureMarkdownRewriterToolUnzipFolder)
$AzureMarkdownRewriterTool = "$AzureMarkdownRewriterToolUnzipFolder\AzureMarkdownRewriterTool.exe"

# Prepare configuration file
$sourceFolder = GetValueFromVariableName($SourceFolder) ($systemDefaultVariables.SourceFolder)
$outputFolder = GetValueFromVariableName($OutputFolder) ($systemDefaultVariables.OutputFolder)
$logOutputFolder = GetValueFromVariableName($LogOutputFolder) ($systemDefaultVariables.LogOutputFolder)
$azureTransformArgsJsonContent = "{`"azure_transform_arguments_list`": [{`"source_dir`":`"$sourceFolder`",`"dest_dir`": `"$outputFolder`",`"docs_host_uri_prefix`": `"https://docspilot.azurewebsites.net/en-us/fenxu_azure_migration`"}],`"is_migration`": true}"

$tempJsonFilePostFix = (Get-Date -Format "yyyyMMddhhmmss") + "-" + [System.IO.Path]::GetRandomFileName() + ".json"
$auzreTransformArgsJsonPath = "$AzureMarkdownRewriterToolUnzipFolder\azureTransformArgs$tempJsonFilePostFix"
$azureTransformArgsJsonContent = $azureTransformArgsJsonContent.Replace("\", "\\")
Out-File -FilePath $auzreTransformArgsJsonPath -InputObject $azureTransformArgsJsonContent -Force

# Prepare azure video file
$azureVideoFileDestination = "$AzureMarkdownRewriterToolUnzipFolder\AzureVideoRawInformation.json"
if (IsNullOrEmptyValue($AzureVideoFile))
{
    echo "No AzureVideoFile specified. Use the default version in system." | timestamp
    $azureVideoFileSource = "$AzureMigrationToolContainerUrl/AzureVideoRawInformation.json"
    DownloadFile($azureVideoFileSource) ($azureVideoFileDestination) ($true)
}
else
{
  $azureVideoFileDestination = $AzureVideoFile
}
if(!(Test-Path $azureVideoFileDestination))
{
    exit ConsoleErrorAndExit("Can't find azure video file in path: $azureVideoFileSource. Stop migration.") (1)
}

# Prepare parameters
$documentUriPrefix = GetValueFromVariableName($DocumentUriPrefix) ($systemDefaultVariables.DocumentUriPrefix)
if(!(Test-Path $logOutputFolder))
{
    New-Item $logOutputFolder -ItemType directory
}
$logFile = "$logOutputFolder\migrationRawLog.txt"


&"$AzureMarkdownRewriterTool" "$repositoryRoot" "$auzreTransformArgsJsonPath" "$documentUriPrefix" "$azureVideoFileDestination" | Tee-Object -file $logFile


if ($LASTEXITCODE -ne 0)
{
  exit ConsoleErrorAndExit("Migration has some warnings or errors. Please see the detail in log file at `"$logFile`".") (1)
}

echo "Migration succeed." | timestamp
exit 0