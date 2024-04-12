---
title: Use your own network isolated Azure Data Lake Storage Gen2
description: Learn how to store and read event log data directly from network isolated Azure Data Lake Storage Gen2.
author: rosikm
contributors:
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 08/08/2023
ms.custom: bap-template
ms.author: michalrosik
ms.reviewer: angieandrews
---

# Use your own network isolated Azure Data Lake Storage Gen2

Onboarding your Azure Data Lake can be found [here](process-mining-byo-azure-data-lake.md) but relates to storage accounts that are open to the public internet. To use Process Mining against network isolated Azure Data Lakes please follow the steps in this document.

## Prerequisites

### Perform/verify your Azure Storage account is network isolated

In the [Azure portal](https://portal.azure.com) visit the *Networking* tab for the storage account and proceed to set the following values.  The red items are expected to be permanently set; the green items can be set temporarily.

:::image type="content" source="media/process-mining-byo-azure-data-lake/AzurePortalSettings.svg" alt-text="Screenshot of the storage account settings.":::

## Run PowerShell script to create a managed identity (needs to be run per environment)

The minimum required role to complete all steps is *Azure Subscription Owner* for the subscription that contains the storage account and additionally the user must be an administrator on the environment that the policy will be connected.

Here are the specific set of steps needed from a completely new state:
1.	Install Azure CLI on your machine: https://aka.ms/InstallAzureCliWindows
1.	Get the compressed folder in https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/managed-identities/Common.zip and download. Extract the compressed folder and make sure you can run PowerShell scripts from that location.
1.	From the root of the folder, carefully go through the set of steps below. Note that there is some modification necessary to the scripts.
1.	Take the following PowerShell script and use it to create a new .ps1 file in the root of the “Common” directory. Give it any name of your choosing.

```azurepowershell-interactive
# PowerShell script
# To have ready beforehand $subscriptionId, $resourceGroupName, $enterprisePolicyLocation, $environmentId
# Note: The $enterprisePolicyLocation must be set to the same location as the environment. And the environments with spaces should have the spaces removed i.e. “South Africa” -> “southafrica”
# Note: You can choose the value for $NewEnterprisePolicyName i.e. CreateMSITokenForExternalLake  

Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber

Az login
Update-AzConfig -DefaultSubscriptionForLogin $subscriptionId

./SetupSubscriptionForPowerPlatform.ps1
$subscriptionId

cd Identity
./CreateIdentityEnterprisePolicy.ps1
$subscriptionId
$resourceGroupName
$NewEnterprisePolicyName
$enterprisePolicyLocation

./NewIdentity.ps1 -environmentId $environmentId -policyArmId /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.PowerPlatform/enterprisePolicies/$NewEnterprisePolicyName -endpoint prod
```

1.	To find the respective $enterprisePolicyLocation for the script above visit here
    1.	The $enterprisePolicyLocation must be set to the same location as the environment. And the environments with spaces should have the spaces removed.
    1.	i.e. “South Africa” -> “southafrica”
1.	Run the newly created .ps1 file using Windows PowerShell
    :::image type="content" source="media/process-mining-byo-azure-data-lake/Prompt.svg" alt-text="Screenshot of powershell prompt with run ps1 script command.":::
1.	Walk through the series of steps until the script outputs a successful 202 response.

> [!NOTE]
> Only one managed identity can be associated to a Dataverse environment at a time. If another is connected to the same environment, then the previous association is lost.

## Once the managed identity is successfully created, add it through Access Control (IAM)

1.	In the Azure portal go to the Storage account
1.	Click *Access Control (IAM)* in the lefthand navigation pane
1.	Click the *Add* dropdown and select *Add role assignment*
1.	Under Role search for *Storage Blob Data Contributor* and select it
1.	Under members choose *Managed identity* and click *Select members*
1.	Locate your subscription name in the Subscription dropdown
1.	In the Managed identity dropdown find the *Microsoft.powerplatform/enterprisepolicies* and select it
1.	In the *Select* dropdown locate the identity you created. It will be named what you named the *NewEnterprisePolicyName* in the PowerShell script
1.	Click *Select* and then *Review + assign*

# Troubleshooting

If presented with the following error message in the [Connection Setup screen](process-mining-byo-azure-data-lake.md), you’ll need to have the owner of the storage account and the person who initially established the connection share the *datalakefolder* record with you in the respective org within Dataverse.  

:::image type="content" source="media/process-mining-byo-azure-data-lake/Error.svg" alt-text="Screenshot of the error message when connecting to the container.":::

To do that you will need to visit the url below, replacing *your_org_url* with the real value.
-	[your_org_url]/main.aspx?app=d365default&forceUCI=1&pagetype=entitylist&etn=datalakefolder
-	To find “your_org_url” visit the Process Mining homepage in the Power Automate environment and execute the following key command *CTRL + ALT + A* and you will find it in the *Instance url* entry.
-	Example: https://org0a00aab.crm10.dynamics.com/main.aspx?app=d365default&forceUCI=1&pagetype=entitylist&etn=datalakefolder

