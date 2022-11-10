---
title: Edit and refresh processes in process advisor (preview) | Microsoft Docs
description: This topic describes how to edit and refresh processes with process mining in the process advisor feature in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Edit and refresh processes in process advisor (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Some of the reasons why you might want to edit the query are:

- Your data might have multiple ID columns that can be used as case ID. There often isn't a correct answer. You might discover more insights by changing what you use as case ID.

- You have more than five additional columns with useful data. You want to try analyzing other columns to see if they're potentially useful in uncovering root causes of bottlenecks.

## Edit query

1. In the process details page, return to the Query Editor by selecting **Setup**.

1. If you want to change the case ID or other mappings, you can do so by changing the values in the dropdown that correspond to the column name from the original data. 

1. If you want to make more advanced edits, select the **Transform data in Power Query** button on the top right.

1. In the Power Query editor, if you've already added the step you want to edit, like choose columns, select (or double-click) the corresponding step in the **Applied steps** area under **Query settings** to edit those steps.  

1. Otherwise, select the step you want to add in the toolbar.

   :::image type="content" source="media/process-mining-data-source/applied-steps.png" alt-text="Screenshot of the Query settings dialog.":::

   > [!WARNING]
   >
   > Try to avoid selecting options like **Choose columns** again in the toolbar if they're already listed in the applied steps, as it will be added as a new step to the end of applied steps. This means that if you already applied the **Choose columns** step, the new **Choose columns** step will give you fewer options to choose from, since the original **Choose columns** step already filtered down the list of available columns.

   :::image type="content" source="media/process-mining-data-source/applied-steps-warning.png" alt-text="Screenshot of the Applied steps in the Query settings dialog.":::

## Refresh data

If you have a data source that's transactional, like Dataverse or SQL, select **Refresh** on the right side of the Data Source card in the Process details page. You need to select **Analyze** again after selecting **Refresh**. You also need to do this if you want to see the Analytics page updated with the latest data from that data source.

## Disconnect data

If you want to change the data source for your process, you can easily do this. For example, you might have been using a CSV file before but now you want to connect to a transactional data source instead. In this example, select **Disconnect data** on the right side of the Data Source card. In the Process details page, once you disconnect, select **Setup** again to connect to your new data source.
