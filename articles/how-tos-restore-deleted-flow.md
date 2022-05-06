---
title: Restore deleted flows with PowerShell in Power Automate | Microsoft Docs
description: Learn how to restore deleted flows with PowerShell in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/04/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Restore deleted flows with PowerShell

If you or someone else accidentally deletes a non-solution aware flow, you can use PowerShell to restore it within 28 days of deletion. Please note that flows are not recoverable after 28 days has passed.

>[!NOTE]
>The steps that this article outlines apply only to non-solution flows. If you deleted a flow which was part of a solution, you need to file a support ticket with Microsoft for assistance.

## Prerequisites

- You must install the [PowerShell cmdlets for PowerApps](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.147).
- You must be an environment admin.
- There must be an [execution policy](/powershell/module/microsoft.powershell.security/set-executionpolicy) set on your device to run PowerShell scripts.

## Restore deleted flow

1. Open PowerShell with elevated priviliges to begin.

   ![A screenshot that shows PowerShell being launched from Windows](./media/restore-deleted-flow/open-powershell-script.png)

1. Install the [PowerShell cmdlets for PowerApps](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.147).

1. Sign into your Power Apps environment.

   Use this command to authenticate to an environment. This command opens a separate window that prompts for your Azure Active Directory (AAD) authentication details.

   ```Add-PowerAppsAccount```

1. Provide the credentials you want to use to connect to your environment.

1. Run the following script to get a list of flows that were soft-deleted within the past 28 days.

   ```Get-AdminFlow -EnvironmentName 41a90621-d489-4c6f-9172-81183bd7db6c IncludeDeleted $true```

   ![Screenshot that displays the output of Get-AdminFlow.](./media/restore-deleted-flow/get-admin-flow-script.png)

1. Optionally, you can filter the list of flows that were soft-deleted if you know part of the name of the deleted flow whose flowID you want to find. To do this, use a script similar to this one that finds all flows in environment 3c2f7648-ad60-4871-91cb-b77d7ef3c239 that contain the string "Foobar" in their display name.
   ```Get-AdminFlow Foobar -EnvironmentName 3c2f7648-ad60-4871-91cb-b77d7ef3c239```

1. Make a note of the flowID of the flow you want to restore.

   >[!TIP]
   >Navigate to the URL of any of the flows in your environment to get your environment ID. Do not omit the prefixed words in the URL for example, Default-8ae09283902-....

1. Run the following script to restore the soft-deleted flow with flowID 4d1f7648-ad60-4871-91cb-b77d7ef3c239 in an environment named Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877.

   ```Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName 4d1f7648-ad60-4871-91cb-b77d7ef3c239```

1. Optionally, you can run the ```Restore-AdminFlow``` script with the following arguments to restore multiple deleted flows.

   ```foreach ($id in @( "4d1f7648-ad60-4871-91cb-b77d7ef3c239", "eb2266a8-67b6-4919-8afd-f59c3c0e4131" )) { Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName $id Start-Sleep -Seconds 1 }```
