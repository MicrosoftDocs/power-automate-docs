---
title: Rebind reports without using a composite model - same workspace
description: Learn how to rebind reports without using a composite model with the same workspace.
author: janPidych
contributors:
  - janPidych
  - rosikm
  - hamenon-ms
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 08/12/2024
ms.author: michalrosik

ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Rebind reports without using a composite model (same workspace)

If your process in the Test environment is connected to the same workspace (for example, WkSpace A) as the one used in your Dev environment (for example, WkSpace A), follow the steps in this article.

## Attach a workspace to your process

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]

4. If you newly imported the process, continue to step 5. If you didn't newly import the process, go to step 7.
1. Select the type of workspace to be used: Power BI workspace or Fabric workspace
    1. The dialog informs you whether you originally exported the process to Power BI or Fabric workspace.
    2. Select the same type of workspace.
    3. Select **Continue**.
1. Select the *same workspace* for this process by following these steps:
    1. For Power BI workspace—in the **Power BI workspace** dropdown menu, select the *same workspace* as the previous workspace.
    1. For Fabric workspace—in the **Fabric workspace** dropdown menu, select the *same workspace* as the previous workspace, in the **Lakehouse** dropdown menu, select the same Lakehouse.
    1. In the **Report Name** field, enter a *different* report name from your previous report name.

        > [!IMPORTANT]
        > The report name must be different from your previous report name.

    1. To continue setting up the process, select **Continue**.

       :::image type="content" source="media/process-mining-alm-rebind-without-comp/new-workspace-same.png" alt-text="Screenshot of selecting a new workspace for your process with a different report name from your previous report.":::

1. (If you didn't newly import the process) Attach a custom Power BI workspace to the process:
    1. Go to the process details page for the process.
    1. On the **Details** card, select **Edit**.
    1. From the **Power BI workspace (optional)** dropdown menu, select your **WkSpace A** Power BI workspace that you want to migrate customizations to.
    1. Provide a *different* report name from the name you used for the process in Dev environment.

        > [!IMPORTANT]
        >
        > The report name must be different from the report name of the process in Dev environment.

    1. Select **Save** > **Continue**.
    1. From the command bar or in the report view, select **Refresh data**.

## Rebind the Power BI report

1. Sign in to [Power BI](https://msit.powerbi.com/home).
1. From the left navigation pane, select **Workspaces** > your **WkSpace A**.
1. In your **WkSpace A**, open your **Report A**.
1. From the command bar, download the report by selecting **File** >**Download this file** > **"A copy of your report with a live connection"** > **Download**.
1. Open the downloaded report in Power BI for desktop.
1. From the **File** menu, select **Save as**.
1. Enter the *same name* for the report as your Report B, and then select **Save**.

    > [!IMPORTANT]
    > Make sure you to do this step to ensure that this report overwrites Report B when you publish.

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/save-as-same.png" alt-text="Screenshot of how to overwrite a report.":::

1. From the command bar in the **Home** tab, select **Transform data** > **Data source settings**.
1. From the list of semantic models, select the semantic model of the process that's in the Test environment and whose report is in your **WkSpace A**, and then select **Connect**.

    Since you're using the same workspace for both your processes in Dev and Test, the location of the semantic model you select is your **WkSpace A**. This is called *rebinding*.

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/semantic-same.png" alt-text="Screenshot of the new report in your WkSpace A location.":::

    The report refreshes. Learn more about semantic models in [Semantic models in the Power BI service](/power-bi/connect-data/service-datasets-understand).

1. From the command bar, save the report by selecting **Save**.
1. From the command bar, publish the report by selecting **Publish**.
1. From the list of destinations, select your **WkSpace A** > **Select**.

    A message that says **Replacing report** opens, indicating you gave the report the same name as your old Report B.

1. To overwrite the old report in WkSpace A, select **Replace**.

1. When this process completes, return to Power BI and open **WkSpace A**.

    The customizations from Report A are now successfully transferred to Report B in the same **WkSpace A**.
