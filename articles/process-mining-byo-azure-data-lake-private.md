---
title: Bring your own network isolated Azure Data Lake Storage Gen2
description: Learn how to store and read event log data directly from network isolated Azure Data Lake Storage Gen2.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 04/22/2024
ms.custom: bap-template
ms.author: michalrosik
ms.reviewer: angieandrews
---

# Bring your own network isolated Azure Data Lake Storage Gen2

Onboarding your Azure Data Lake can be found in [Use your own Azure Data Lake Storage Gen2](process-mining-byo-azure-data-lake.md), but relates to storage accounts that are open to the public internet. To use Process Mining against network isolated Azure Data Lakes, follow the steps in this article.

## Prerequisites

Perform and verify your Azure Storage account is network isolated.

In the [Azure portal](https://portal.azure.com), go to the **Networking** tab for the storage account and proceed to set the following values.

These fields are expected to be permanently set:
- **Enabled from selected virtual networks and IP addresses**
- **Allow Azure services on the trusted services list to access this storage account** 

 This field can be temporarily set:
- **Add your client IP address** 

The following screenshot shows the permanent and temporary fields.

:::image type="content" source="media/process-mining-byo-azure-data-lake-private/azure-portal-settings.png" alt-text="Screenshot of the storage account settings.":::

## Create a managed identity

You need to run a PowerShell script to create a managed identity. This script needs to be run per environment.

The minimum required role to complete all steps is **Azure Subscription Owner** for the subscription that contains the storage account. The user must be an administrator on the environment that the policy will be connected.

The following steps are needed from a completely new state:

1. Install Azure CLI on your machine: https://aka.ms/InstallAzureCliWindows
1. Get the compressed folder in https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/managed-identities/Common.zip and download.
1. Extract the compressed folder and make sure you can run PowerShell scripts from that location.
1. From the root of the folder, go through the ollowing set of steps. Some modification is necessary to the scripts.
1. Take the following PowerShell script and use it to create a new `.ps1` file in the root of the `Common` directory. Choose any name for it.

```powershell
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

6. To find the respective $enterprisePolicyLocation for the previous script, go to:
    1. The $enterprisePolicyLocation must be set to the same location as the environment. And the environments with spaces should have the spaces removed.
    1. For example, set  *South Africa* as *southafrica*.
1. Run the newly created `.ps1` file using Windows PowerShell.

    :::image type="content" source="media/process-mining-byo-azure-data-lake-private/prompt-ps.svg" alt-text="Screenshot of PowerShell prompt with run ps1 script command.":::

1. Walk through the series of steps until the script outputs a successful **202** response.

> [!NOTE]
> Only one managed identity can be associated to a Dataverse environment at a time. If another is connected to the same environment, then the previous association is lost.

## Add the managed identity

Once the managed identity is successfully created, add it through Access Control (IAM).

1. In the Azure portal, go to the Storage account.
1. On the navigation pane to the left, select **Access Control (IAM)**.
1. In the **Add** dropdown list, select **Add role assignment**.
1. Under **Role**, search for and select **Storage Blob Data Contributor**.
1. Under **members**, select **Managed identity** and then select **Select members**.
1. In the **Subscription** dropdown list, locate your subscription name.
1. In the **Managed identity** dropdown list, find and select **Microsoft.powerplatform/enterprisepolicies**.
1. In the **Select** dropdown list, locate the identity you created. It uses the name you used in the **NewEnterprisePolicyName** in the PowerShell script.
1. Select **Select** and then **Review** + **assign**.

## Troubleshooting

If you get the error message, **Couldn't connect to container** in the [Connection Setup screen](process-mining-byo-azure-data-lake.md), you need to have the owner of the storage account and the person who initially established the connection share the **datalakefolder** record with you in the respective org in Dataverse.  

:::image type="content" source="media/process-mining-byo-azure-data-lake-private/error.png" alt-text="Screenshot of the error message when connecting to the container.":::

To fix this error, go to ***[your_org_url]*****/main.aspx?app=d365default&forceUCI=1&pagetype=entitylist&etn=datalakefolder** and replace ***[your_org_url]*** with the real value.

1. Find ***[your_org_url]*** by doing the following steps:
    1. In the Power Automate environments, go to the Process Mining homepage.
    1. Select **Ctrl** + **Alt** + **A**.
    1. In **Instance url**, find ***[your_org_url]***.
    1. Go to ***[your_org_url]*****/main.aspx?app=d365default&forceUCI=1&pagetype=entitylist&etn=datalakefolder** and replace ***[your_org_url]*** with the real value.

        Example:<br/>
        `https://org0a00aab.crm10.dynamics.com/main.aspx?app=d365default&forceUCI=1&pagetype=entitylist&etn=datalakefolder`

1. On the loaded page, do the following steps:
    1. From the table, select the appropriate **data lake folder** record.
    1. At the top of the screen, select **Share**.
    1. To search for the user to add, select **Add User/Team**.
    1. Select **Share**.
