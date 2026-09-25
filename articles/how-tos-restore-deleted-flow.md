---
title: Restore deleted flows in Power Automate
description: Learn how to restore deleted flows in Power Automate.
author: radioblazer
contributors:
 - kisubedi
 - natalie-pienkowska
 - mregateiro
 - v-aangie
 - cyrilanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.date: 09/22/2026
ms.topic: how-to
ms.author: matow
ms.reviewer: cyanderson
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# Restore deleted flows

If you or someone else accidentally deletes a non-solution or solution flow, you can restore it within 21 days of deletion.

You can restore deleted flows in two ways:

- Use the [Power Automate Management connector](#restore-deleted-flows-with-the-power-automate-management-connector) to restore the deleted flows.
- Use [PowerShell](#restore-deleted-flows-with-powershell) to restore the deleted flows.

>[!NOTE]
>
> - The steps in this article apply to both non-solution and solution flows.
> - You can't recover flows that you deleted more than 21 days ago. Both restore methods (PowerShell script and Power Automate Management connector), as well as Microsoft Support, can't restore them.
> - After you restore a flow, it defaults to the disabled state. You must manually enable the flow.
> - Learn more about restoring a deleted desktop flow created by Power Automate for desktop in [Restore a deleted desktop flow](/power-automate/desktop-flows/how-to/restore-deleted-desktop-flow).

## Restore deleted flows with the Power Automate Management connector

You can restore a deleted non-solution or solution flow within 21 days of deletion by using Power Automate. A non-solution flow is a flow that you didn't create inside a solution. As an admin, all you need is a button flow with the Power Automate management connector action: **Restore Deleted Flow as Admin**.  

1. Build a manual flow with a button trigger.  

    :::image type="content" source="./media/restore-deleted-flow/build-button-trigger.png" alt-text="Screenshot of a manual flow with a button trigger.":::

1. Add the **Restore Deleted Flow as Admin** action and run the flow:

    1. Add the **Restore Deleted Flow as Admin** action from the Power Automate Management Connector.
    1. Select the **Environment** where the flow was originally deleted.
    1. In the **Flow** field, select the display name of the flow you want to restore.
    1. Run the flow.

When the run succeeds, you restore the flow in a disabled state in the environment where you originally deleted it.

:::image type="content" source="./media/restore-deleted-flow/restored-deleted-flow.png" alt-text="Screenshot of a restored flow.":::

## Restore deleted flows with PowerShell

In this section, you learn how to restore deleted flows by using PowerShell.

### Prerequisites for PowerShell

- You must install the latest version of [PowerShell cmdlets for Power Apps](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.147).
- You must be an environment admin.
- There must be an [execution policy](/powershell/module/microsoft.powershell.security/set-executionpolicy) set on your device to run PowerShell scripts.

1. Open PowerShell with elevated privileges to begin.

    :::image type="content" source="./media/restore-deleted-flow/open-powershell-script.png" alt-text="Screenshot that shows PowerShell being launched from Windows.":::

1. Install the latest version of [PowerShell cmdlets for Power Apps](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.147).

1. Sign in to your Power Apps environment.

   Use this command to authenticate to an environment. This command opens a separate window that prompts for your Microsoft Entra authentication details.

    ``` PowerShell
    Add-PowerAppsAccount
    ```

1. Provide the credentials you want to use to connect to your environment.

1. Run the following script to get a list of flows in the environment, including flows that were soft-deleted within the past 21 days.

    If the `IncludeDeleted` parameter isn't recognized, you might be working with an older version of the PowerShell scripts. Ensure that you're using the [latest version](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.147) of the script modules and retry the steps.

   ``` PowerShell
   Get-AdminFlow -EnvironmentName 41a90621-d489-4c6f-9172-81183bd7db6c -IncludeDeleted $true
   //To view examples: Get-Help Get-AdminFlow -Examples
   ```

   > [!TIP]
   > Navigate to the URL of any of the flows in your environment to get your environment name (`https://make.powerautomate.com/Environments/<**EnvironmentName**>/flows`). You need the environment name for subsequent steps. Don't omit the prefixed words in the URL if your environment name contains it, for example, Default-8ae09283902-....

     :::image type="content" source="./media/restore-deleted-flow/get-admin-flow-script.png" alt-text="Screenshot that displays the output of Get-AdminFlow.":::

1. Optionally, you can filter the list of flows if you know part of the name of the deleted flow whose flowID you want to find. To do this, use a script similar to this one that finds all flows (including flows that were soft-deleted) in environment 3c2f7648-ad60-4871-91cb-b77d7ef3c239 that contain the string "Testing" in their display name.
256fe2cd306052f68b89f96bc6be643

   ``` PowerShell
   Get-AdminFlow Testing -EnvironmentName 3c2f7648-ad60-4871-91cb-b77d7ef3c239 -IncludeDeleted $true
   ```

1. Make a note of the `FlowName` value of the flow you want to restore from the previous step.

1. Run the following script to restore the soft-deleted flow with `FlowName` value as `4d1f7648-ad60-4871-91cb-b77d7ef3c239` in an environment named `Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877`.

   ``` PowerShell
   Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName 4d1f7648-ad60-4871-91cb-b77d7ef3c239
    //To view examples: Get-Help Restore-AdminFlow -Examples
   ```

1. Optionally, you can run the ```Restore-AdminFlow``` script with the following arguments to restore multiple deleted flows.

   ``` PowerShell
   foreach ($id in @( "4d1f7648-ad60-4871-91cb-b77d7ef3c239", "eb2266a8-67b6-4919-8afd-f59c3c0e4131" )) { Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName $id; Start-Sleep -Seconds 1 }
   ```
