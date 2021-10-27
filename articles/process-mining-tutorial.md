---
title: Use process mining to analyze and improve your processes in process advisor (preview) | Microsoft Docs
description: This topic is a tutorial with demo data in process mining using the process advisor feature in Power Automate.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.custom: intro-internal
ms.date: 11/02/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow[https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true](https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true)
search.audienceType: 
  - flowmaker
  - enduser
---

# Tutorial: Get started with process mining in process advisor (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

This tutorial allows you to experience process mining with sample data. In this tutorial, you'll create a process, import data, and then analyze it.

For the process mining tutorial, download the sample event log CSV file: [ProcessMiningSampleData.csv](https://go.microsoft.com/fwlink/?linkid=2174463). For the task mining tutorial, go to [Tutorial: Get started with task mining](task-mining-quickstart.md).

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]


## Create a process

1. Sign in to [Power Automate](https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true).

1. Select your environment.

1. On the navigation pane to the left, select **Process advisor** > **Create**.

1. Select **Create a new process**.

1. Enter a process name, and then select **Data (preview)**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Data (preview) button.](media/process-mining-tutorial/data-preview.png "Data (preview)")

1. Select **Create**.

## Import data and analyze

1. In your process, select **Setup** in the toolbar. <!-- Is this correct? I added it. -->

1.	Select **Blank table**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of blank table selection.](media/process-mining-tutorial/blank-table.png "Blank table selection")

1. Open the sample event log CSV file that you downloaded in Microsoft Windows Notepad (or any text editor).

1. Select all contents of the CSV file by pressing **Ctrl** + **A**.

1. Copy the selection by pressing **Ctrl** + **C**. 

1. Paste the selection you copied into the blank table in process advisor by pressing **Ctrl** + **V**. 

1. Select **Use first row as headers**. 

    > [!div class="mx-imgBorder"]
    > ![Screenshot of first row as headers selection.](media/process-mining-tutorial/headers.png "First row as headers selection")

1. Upload your event log, select your file from the list, and choose **Select** to continue.

1. Select **Next** twice to open the Power Query editor.

1. Validate that your fields are correct in the table view.

1. On the toolbar, select **Map to entity**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Map to entity button.](media/process-mining-tutorial/map-to-entity.png "Map to entity button")

1. On the left pane, select the **Event log** entity.

1. On the right pane, map the three required columns by selecting **Auto map**.

1. Return to the Power Query editor by selecting **OK**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of auto mapping.](media/process-mining-tutorial/auto-map.png "Auto map")

1. Return to the process details page by selecting **Save**.

1. On the toolbar, select **Analyze**, and then select **Confirm** when the dialog opens.

1. Wait for the analysis to complete. After the process is analyzed, select **Analytics** in the toolbar to view the process map.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of an analyzed process.](media/process-mining-tutorial/analytics.png "Process status is 'Analyzed'")

1. For a description of how to analyze the process map and a short video, go to [Visualize and analyze processes with process mining (preview)](process-mining-visualize.md).
