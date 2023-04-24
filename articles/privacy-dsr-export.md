---
title: Respond to personal data export requests (Azure AD)
description: Learn about the resources available in Power Automate to help you meet your obligations to export customers' personal data under various privacy laws and regulations for users who authenticate using Azure AD.
suite: flow
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
ms.reviewer: gtrantzas
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/18/2023
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---
# Respond to personal data export requests (Azure AD)

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

[!INCLUDE [gdpr-dsr-export-note](~/../shared-content/shared/privacy-includes/gdpr-dsr-export-note.md)]

The right of data portability allows data subjects to request a copy of their personal data in an electronic format that may be transmitted to another data controller.

The following table summarizes where to find and export the personal data of a user who authenticates using Azure Active Directory (Azure AD) in Power Automate.

- **Website access:** Sign in to the [Power Apps admin center](https://admin.powerapps.com/) or the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
- **PowerShell access:** [Power Apps Admin PowerShell cmdlets](/power-platform/admin/powerapps-powershell)

| Customer data | Website access | PowerShell access |
| ----------------- | ------------------ | -------------------|
| System-generated logs | [Office 365 Service Trust Portal](https://servicetrust.microsoft.com/) |
| Run history | Power Automate maker portal | |
| Flows | Power Automate maker portal | |
| Flow permissions | Power Automate maker portal and Power Automate admin center | |
| User details | | Power Apps cmdlets |
| Connections | Power Automate maker portal | Power Apps cmdlets |
| Connection permissions | Power Automate maker portal | Power Apps cmdlets |
| Custom connectors | Power Automate maker portal | Power Apps cmdlets |
| Custom connector permissions | Power Automate maker portal | Power Apps cmdlets |
| Gateway | Power Automate maker portal | On-premises data gateway PowerShell cmdlets |
| Gateway permissions | Power Automate maker portal | On-premises data gateway PowerShell cmdlets |

## Export a cloud flow

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. In the left navigation pane, select **My flows**.

1. Select a flow, select **&hellip; More**, and then select **Export**.

    :::image type="content" source="media/privacy-dsr-export/export-flow.png" alt-text="Screenshot of exporting a Power Automate flow.":::

1. Select **Package (.zip)**.

Your flow is downloaded as a zipped archive.

## Export run history

Run history lists all executions of a cloud flow, including a run's status, start time, duration, and inputs and outputs.

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. In the left navigation pane, select **My flows**.

1. Select a flow.

1. In the **RUN HISTORY** pane, select **See all**.

    :::image type="content" source="media/privacy-dsr-export/run-history.png" alt-text="Screenshot of a flow's run history.":::

1. At the top of the page, select **Download CSV**.

The run history is downloaded as a .csv file so that you can open it in Microsoft Excel or a text editor and analyze the results.

## Export a user's activity feed

The activity feed shows a history of a user's activities, flow execution failures, and notifications.

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. Select the bell icon in the upper-right corner of the page, and then select **Show all activity**.

1. Copy the contents of the **Activity** page and paste them into a document editor such as Microsoft Word.

## Export a user's connections

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. Select the gear icon in the upper-right corner of the page, and then select **Connections**.

1. Copy the list, and then paste it into a document editor such as Microsoft Word.

## Export a user's connections using a PowerShell cmdlet

```PowerShell
Add-PowerAppsAccount

#Retrieves all connections for the specified userID
Add-PowerAppsAccount
$userId = "{userID}"
Get-AdminConnection -CreateBy $userId | ConvertTo-Json | Out-File -FilePath "UserConnections.txt"
```

## Export a user's connection permissions using PowerShell cmdlets

```PowerShell
Add-PowerAppsAccount
Get-ConnectionRoleAssignment | ConvertTo-Json | Out-File -FilePath "ConnectionPermissions.txt"
```

```PowerShell
Add-PowerAppsAccount

#Retrieves all connection permissions for the specified userID
Add-PowerAppsAccount
$userId = "{userID}"
Get-AdminConnectionRoleAssignment -PrincipalObjectId $userId | ConvertTo-Json | Out-File -FilePath "ConnectionPermissions.txt" 
```

## Export a user's custom connectors

1. Sign in to [Power Automate](https://flow.microsoft.com).

1. Select the gear icon in the upper-right corner of the page, and then select **Custom Connectors**.

1. Copy the list, and then paste it into a document editor such as Microsoft Word.

## Export a user's custom connectors using PowerShell cmdlets

```PowerShell
Add-PowerAppsAccount
Get-Connector -FilterNonCustomConnectors | ConvertTo-Json | Out-File -FilePath "CustomConnectors.txt"
```

```PowerShell
Add-PowerAppsAccount

#Retrieves all custom connectors for the specified userID
Add-PowerAppsAccount
$userId = "{userID}"
Get-AdminConnector -CreatedBy $userId | ConvertTo-Json | Out-File -FilePath "UserCustomConnectors.txt"  
```

## Export a user's custom connector permissions using PowerShell cmdlets

```PowerShell
Add-PowerAppsAccount
Get-ConnectorRoleAssignment | ConvertTo-Json | Out-File -FilePath "CustomConnectorPermissions.txt"
```

```PowerShell
Add-PowerAppsAccount

#Retrieves all connection permissions for the specified userID 
Add-PowerAppsAccount
$userId = "{userID}"
Get-AdminConnectorRoleAssignment -PrincipalObjectId $userId | ConvertTo-Json | Out-File -FilePath "CustomConnectorPermissions.txt"   
```

## Export a user's approval history

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. Select **Approvals**, and then select **History**.

1. Copy the lists of approvals sent and received, and then paste them into a document editor such as Microsoft Word.

## Export a user's details using a PowerShell cmdlet

```PowerShell
Add-PowerAppsAccount

Get-AdminFlowUserDetails -UserId {userID}
```

## Export gateway settings

[Learn more about responding to data export requests for on-premises data gateways](/power-bi/service-gateway-onprem#tenant-level-administration).

[!INCLUDE [footer-include](includes/footer-banner.md)]
