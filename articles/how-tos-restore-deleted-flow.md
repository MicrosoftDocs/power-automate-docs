---
title: Restore deleted flows in Power Automate
description: Learn how to restore deleted flows in Power Automate.
author: kisubedi
contributors:
 - kisubedi
 - natalie-pienkowska
 - mregateiro
 - v-aangie
ms.subservice: cloud-flow
ms.date: 04/24/2023
ms.topic: conceptual
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Restore deleted flows

If you or someone else accidentally deletes a non-solution or solution flow, you can restore it within 21 days of deletion.

There are the two ways you can restore deleted flows.

- Use the [Power Automate Management connector](#restore-deleted-flows-with-the-power-automate-management-connector) to restore the deleted flows.
- Use [PowerShell](#restore-deleted-flows-with-powershell) to restore the deleted flows.

>[!NOTE]
> - The steps in this article apply to both non-solution and solution flows.
> - Flows that were deleted more than 21 days ago can't be recovered. Both restore methods (PowerShell script and Power Automate Management connector), as well as Microsoft Support can't help to restore them.
> - After you restore a flow, it defaults to the disabled state. You must manually enable the flow, per your requirements.
> - Learn more about restoring a deleted desktop flow created by Power Automate for desktop at [Restore a deleted desktop flow](/power-automate/desktop-flows/how-to/restore-deleted-desktop-flow).

## Restore deleted flows with the Power Automate Management connector

You can restore a deleted non-solution or solution flow within 21 days of deletion using Power Automate. A non-solution flow is a flow that wasn't created inside a solution. As an admin, all you need is a button flow with two Power Automate management connector actions&mdash;**List Flows as Admin** and **Restore Deleted Flows as Admin**.  

As part of this process, in four easy and quick steps, you'll first list deleted flows in an environment using the **List flows as Admin** action. Then, you'll use the **Restore Deleted Flows as Admin** action to restore the flow using `flowName` property of the flow that you retrieved from the **List flows as Admin** action.

1. Build a manual flow with a button trigger.  

    :::image type="content" source="./media/restore-deleted-flow/build-button-trigger.png" alt-text="Screenshot of a manual flow with a button trigger.":::

1. Add the **List Flows as Admin** action.

    1. Select **New Step**.
    
    1. Search for **Power Automate Management Connector** or **List Flows as Admin** action.
    
    1. Select the **List Flows as Admin** action.
    
    1. In the **Environment** dropdown menu, select the environment the flow was originally deleted from.
    
    1. In the **Include Soft-Deleted Flows** dropdown menu, select **Yes**.

    :::image type="content" source="./media/restore-deleted-flow/list-flows-admin.png" alt-text="Screenshot of adding the 'List Flows as Admin' action.":::

1. Run the flow to note the `flowName` of the flow you want to retrieve.

    1. Run the flow.
    1. Expand the flow run.
    1. Expand the raw **OUTPUTS/value** of the **List Flows as Admin** action.

        You'll see all the flows in that environment you have access to as an admin, including the ones that are soft deleted.

    1. Using the **"displayName"** among other flow metadata, identify the flow you're trying to recover and note the name in **"name"** field.

        In the following screenshot, the name of the flow is highlighted in green. You'll use this value for the next step.

        :::image type="content" source="./media/restore-deleted-flow/run-flow-flowname.png" alt-text="Screenshot of the flow name in the action output.":::

1. Add the **Restore Deleted Flows as Admin** action and run the flow.

    1. Add the **Restore Deleted Flows as Admin** action from the Power Automate Management Connector.
    1. In the **Flow** field, enter the name value from step 3.

        :::image type="content" source="./media/restore-deleted-flow/restore-deleted-flow.png" alt-text="Screenshot of adding the 'Restore Deleted Flows as Admin' action.":::

    1. Run the flow.

        :::image type="content" source="./media/restore-deleted-flow/run-flow.png" alt-text="Screenshot of a successfully run flow.":::

    After the run has succeeded, you'll notice that the flow has been restored in a disabled state in the environment it was originally deleted from.

    :::image type="content" source="./media/restore-deleted-flow/restored-deleted-flow.png" alt-text="Screenshot of a restored flow.":::

## Restore deleted flows with PowerShell

In this section, you'll learn about how to restore deleted flows using PowerShell.

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

   >[!TIP]
   >Navigate to the URL of any of the flows in your environment to get your environment name (https://make.powerautomate.com/Environments/<**EnvironmentName**>/flows) which is required for subsequent steps. Don't omit the prefixed words in the URL if your environment name contains it, for example, Default-8ae09283902-.... 

     :::image type="content" source="./media/restore-deleted-flow/get-admin-flow-script.png" alt-text="Screenshot that displays the output of Get-AdminFlow.":::

1. Optionally, you can filter the list of flows if you know part of the name of the deleted flow whose flowID you want to find. To do this, use a script similar to this one that finds all flows (including flows that were soft-deleted) in environment 3c2f7648-ad60-4871-91cb-b77d7ef3c239 that contain the string "Testing" in their display name.
256fe2cd306052f68b89f96bc6be643

   ``` PowerShell
   Get-AdminFlow Testing -EnvironmentName 3c2f7648-ad60-4871-91cb-b77d7ef3c239 -IncludeDeleted $true
   ```

1. Make a note of the `FlowName` value of the flow you want to restore from the previous step.

1. Run the following script to restore the soft-deleted flow with `FlowName` value as 4d1f7648-ad60-4871-91cb-b77d7ef3c239 in an environment named Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877.

   ``` PowerShell
   Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName 4d1f7648-ad60-4871-91cb-b77d7ef3c239
    //To view examples: Get-Help Restore-AdminFlow -Examples
   ```

1. Optionally, you can run the ```Restore-AdminFlow``` script with the following arguments to restore multiple deleted flows.

   ``` PowerShell
   foreach ($id in @( "4d1f7648-ad60-4871-91cb-b77d7ef3c239", "eb2266a8-67b6-4919-8afd-f59c3c0e4131" )) { Restore-AdminFlow -EnvironmentName Default-55abc7e5-2812-4d73-9d2f-8d9017f8c877 -FlowName $id; Start-Sleep -Seconds 1 }
   ```
