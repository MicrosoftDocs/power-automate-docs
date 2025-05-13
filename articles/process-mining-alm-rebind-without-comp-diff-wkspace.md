---
title: Rebind reports without using a composite model (different workspaces)
description: Learn how to rebind reports without using a composite model if you linked your process to different workspaces.
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
ms.date: 04/03/2025
ms.author: janpidych
ms.reviewer: ellenwehrle
search.audienceType: 
  - flowmaker
  - enduser
#customer intent: As a business process analyst, I want to migrate my Process Mining reports from one workspace to another without using a composite model so that the report customizations appear where I need them. 
---

# Rebind reports without using a composite model (different workspaces)

If your process in the Test environment is connected to a different workspace (for example, WkSpace B) than the one used in the Development environment (for example, WkSpace A), follow the steps in this article.

## Attach a workspace to your process

Take these steps to attach a workspace to your process:

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]
[!INCLUDE[alm-attach-with-and-without](./includes/alm-attach-with-and-without.md)]

## Rebind the Power BI report

Take these steps to rebind the Power BI report:

1. Sign in to [Power BI](https://msit.powerbi.com/).
1. From the left navigation pane, select **Workspaces** > your **WkSpace A**.
1. In your **WkSpace A**, select your **Report A**.
1. To download the report, select **File** from the command bar > **Download this file** > **"A copy of your report with a live connection…"** > **Download**.
1. Open the downloaded report in Power BI for desktop.
1. After you edit the report, select **Transform data** > **Data source settings** from the command bar in the **Home** tab.
1. Select the semantic model of the process that's in your **WkSpace B** workspace from the list of semantic models, and then select **Connect**.

    This is called *rebinding*. The report refreshes. Learn more about semantic models in [Semantic models in the Power BI service](/power-bi/connect-data/service-datasets-understand).

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/semantic-model.png" alt-text="Screenshot of rebinding your process after you download, edit, and connect your model.":::

1. From the command bar, select **Save** to save the report.
1. From the command bar, select **Publish** to publish the report. 
1. From the **Publish to Power BI** menu, select your **WkSpace B** > **Select**.

    A message that says **Replacing report** appears because you retained the report name.

1. Select **Replace** to overwrite the old report in WkSpace B. This action overwrites the existing report with an updated version that incorporates the new customizations. It also preserves the original report name for consistency.

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/replacing-report.png" alt-text="Screenshot showing how to replace a report.":::

1. When this process completes, return to Power BI and open **WkSpace B**.

    The report is now successfully migrated from WkSpace A and is connected to the semantic model of the process you had in your WkSpace B.
