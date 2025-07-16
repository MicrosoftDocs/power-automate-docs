---
title: Respond to personal data export requests (Microsoft Entra ID)
description: Learn about the resources available in Power Automate to help you meet your obligations to export customers' personal data under various privacy laws and regulations for users who authenticate using Microsoft Entra ID.
author: hamenon-ms
contributors:
  - hamenon-ms
  - v-aangie
ms.author: hamenon
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 07/16/2025
---
# Respond to personal data export requests (Microsoft Entra ID)

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

[!INCLUDE [gdpr-dsr-export-note](~/../shared-content/shared/privacy-includes/gdpr-dsr-export-note.md)]

The right of data portability allows data subjects to request a copy of their personal data in an electronic format that can be transmitted to another data controller.

The following table summarizes where to find and export the personal data of a user who authenticates by using Microsoft Entra in Power Automate.

- **Website access:** Sign in to the [Power Apps admin center](https://admin.powerapps.com/) or [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
- **PowerShell access:** Use [Power Apps Admin PowerShell cmdlets](/power-platform/admin/powerapps-powershell).

| Customer data | Website access | PowerShell access |
|---|---|---|
| System-generated logs | [Office 365 Service Trust Portal](https://servicetrust.microsoft.com/) |
| Run history | Power Automate maker portal | |
| Cloud flows | Power Automate maker portal | |
| Flow permissions | Power Automate maker portal and Power Automate admin center | |
| User details | | Power Apps cmdlets |
| Connections | Power Automate maker portal | Power Apps cmdlets |
| Connection permissions | Power Automate maker portal | Power Apps cmdlets |
| Custom connectors | Power Automate maker portal | Power Apps cmdlets |
| Custom connector permissions | Power Automate maker portal | Power Apps cmdlets |
| Gateway | Power Automate maker portal | On-premises data gateway PowerShell cmdlets |
| Gateway permissions | Power Automate maker portal | On-premises data gateway PowerShell cmdlets |
| Desktop flows | Power Automate maker portal |  |
| Machine and machine groups | Power Automate maker portal |  |
| Hosted machines | Power Automate maker portal |  |
| Process mining processes | Power Automate maker portal |  |

## Export a cloud flow

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. On the left navigation pane, select **My flows**.
1. Select a flow, select **&hellip; More**, and then select **Export**.
1. Select **Package (.zip)**.

    The flow is downloaded as a zipped archive.

## Export run history

Run history lists all executions of a cloud flow. It includes a run's status, start time, duration, inputs, and outputs.

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. On the left navigation pane, select **My flows**.
1. Select a flow.
1. In the **Run history** pane, select **See all**.
1. At the top of the page, select **Download CSV**.

    The run history is downloaded as a .csv file, so that you can open it in Microsoft Excel or a text editor and analyze the results.

## Export a user's activity feed

The activity feed shows a history of a user's activities, flow execution failures, and notifications.

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. Select the bell symbol in the upper-right corner of the page, and then select **Show all activity**.
1. Copy the contents of the **Activity** page, and paste them into a document editor such as Microsoft Word.

## Export a user's connections

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. Select the gear symbol in the upper-right corner of the page, and then select **Connections**.
1. Copy the list, and paste it into a document editor such as Word.

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
1. Select the gear symbol in the upper-right corner of the page, and then select **Custom Connectors**.
1. Copy the list, and paste it into a document editor such as Word.

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

1. On the web or desktop, open [Microsoft Teams](https://teams.microsoft.com).
1. In Teams, follow one of these steps to open the **Approvals** app:

    - From the main search bar, search for **Approvals**. 
    - In the left pane, select the ellipsis (**&hellip;**), and then search for or select **Approvals**.

1. On the **Received** tab, select **Export** in the upper-right corner to export received approvals.
1. Select the export dates, and then select **Export**.
1. On the **Sent** tab, select **Export** in the upper-right corner to export sent approvals.
1. Select the export dates, and then select **Export**.

Repeat the previous procedure for every environment that the user is part. Use the environment switcher in the upper right of the **Approvals** app page to  switch environments.

Alternatively, open [Power Automate](https://make.powerautomate.com), select **Approvals** on the left navigation pane, and select the **History** tab. You can then manually copy approval contents for received and sent approvals. To ensure that you get the contents for both types of approvals, select the appropriate filter (**Received** or **Sent**) in the upper-right corner.

## Export a user's details using a PowerShell cmdlet

```PowerShell
Add-PowerAppsAccount

Get-AdminFlowUserDetails -UserId {userID}
```

## Export desktop flows

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. On the left navigation pane, select **Desktop flows**.
1. Copy the list of desktop flows and paste it into a document editor such as Microsoft Word.

## Export machines and machine groups

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. On the left navigation pane, select **Machines**.
1. Select the **Machine groups** tab.
1. You can then manually copy machine group details for machine groups owned by the user.
1. Select the **Machines** tab.
1. You can then manually copy machine details for machines owned by the user.

## Export process mining processes

Refer to [Export process data](./minit/export.md) to learn how to export process mining processes. You can then analyze the results to look for personal data for the user.

## Export gateway settings

[Learn more about responding to data export requests for on-premises data gateways.](/power-bi/service-gateway-onprem#tenant-level-administration)

[!INCLUDE [footer-include](includes/footer-banner.md)]
