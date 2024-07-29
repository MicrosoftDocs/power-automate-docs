---
title: Rebind reports without using a composite model
description: Learn how to rebind reports without using a composite model with different workspaces or the same workspace.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 08/01/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Rebind reports without using a composite model

The rebind method you choose depends on whether the two processes you have are using two different workspaces or the same workspace.

## With two different workspaces

If you linked your process in Test environment to a workspace (for example, WkSpace B) that's different from the one used by the process in Dev environment (for example, WkSpace A), follow the steps in this section.

### Attach a workspace to your process

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]

### Rebind the Power BI report (different workspaces)

1. Sign in to [Power BI](https://msit.powerbi.com/).
1. From the left navigation pane, select **Workspaces** > your **WkSpace A**.
1. In your **WkSpace A**, select your **Report A**.
1. To download the report, from the command bar, select **File** > **Download this file** > **"A copy of your report with a live connection…"** > **Download**.
1. Open the downloaded report in Power BI for desktop.
1. After you edit the report, select **Transform data** > **Data source settings** from the command bar in the **Home** tab.
1. From the list of semantic models, select the semantic model of the process that's in your **WkSpace B** workspace, and then select **Connect**.

    This is called *rebinding*. The report refreshes. Learn more about semantic models in [Semantic models in the Power BI service](/power-bi/connect-data/service-datasets-understand).

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/semantic-model.png" alt-text="Screenshot of rebinding your process after you download, edit, and connect your model.":::

1. From the command bar, save the report by selecting **Save**.
1. From the command bar, publish the report by selecting **Publish**.
1. From the **Publish to Power BI** menu, select your **WkSpace B** > **Select**.

    A message that says **Replacing report** appears because you retained the report name.

1. Select **Replace** to overwrite the old report in WkSpace B. This action overwrites the existing report with an updated version that incorporates the new customizations. It also preserves the original report name for consistency.

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/replacing-report.png" alt-text="Screenshot of how to replace a report.":::

1. When this process completes, return to Power BI and open **WkSpace B**.

    The report is now successfully migrated from WkSpace A and is connected to the semantic model of the process you had in your WkSpace B.

## With the same workspace

If you linked your process in your Test environment to a workspace (for example, WkSpace A) that's the same as the one used for the process in your Dev environment (for example, WkSpace A), follow the steps in this section.

1. [Attach a workspace to your process](#attach-a-workspace-to-your-process) by following steps 1 through 3 in this article.

1. If you newly imported the process, continue to the following step 3. If you didn't newly import the process, go to step 4.

1. Select the *same workspace* for this process by following these steps:
    1. In the **Power BI workspace** dropdown menu, select the *same workspace* as the previous workspace.
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

### Rebind the Power BI report (same workspace)

1. To download your report in Power BI, do steps 1 through 5 in [Rebind Power BI report (different workspaces)](#rebind-the-power-bi-report-different-workspaces).
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
