---
title: Analyze processes in process advisor (contains video)
description: Learn how to analyze processes with task mining in process advisor. The analyze feature adds a recording into the process map and associated analytics.
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

# Analyze tasks and processes in process advisor

On the left navigation pane in Power Automate, select **Process advisor** > **All Processes**, and then select your process to go to the **Details** screen. This is where you'll access most of your tasks and process management activities.

> [!NOTE]
> The [TDS endpoint setting](/power-platform/admin/settings-features) for your organization needs to be enabled. This feature is enabled by default, but if it's disabled for any reason, contact your Microsoft Power Platform administrator to enable it in the Power Platform admin center.

## View your process map and related analytics

To begin analyzing your process, start by checking the status of your recordings and using the **Analyze** button in the command bar. This button will add the selected recording into the process map and related analytics. Please note that the analytics reports will only include insights from recordings that have the "Analyzed" status.

- After the task is analyzed, the process map and related analytics are available when you select **Analytics** in the menu.

- On the **Details** card, you can check the status of the analysis for your process and whether it has been previously analyzed.

- Analysis happens at the process level for all recordings that are ready to be analyzed.

- Pay attention to the recording status, which you can find under the Status column of the Recordings pane. Only recordings with the "Ready to analyze" status will be considered for analysis.

    :::image type="content" source="./media/related-nalytics.png" alt-text="Screenshot of the details and recordings in the 'Analytics' screen.":::

Here's a short video on how to view analytics with process advisor:<br>
</br>
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWMYVy ]

## View your recording status

The status of each recording can be found under the Status column of the Recordings pane. Recordings can have one of the following statuses:

-**In progress:** This means that the recording is currently being made, or it may not have started yet. The web portal cannot determine the status of the recording until it has been saved because the recording happens in the desktop client. Even after a recording has been saved, it's possible to see the "In progress" status because some processing is required to make the recording ready to view.

- **Failed:** An error occurred while processing the recording. You'll need to create a new recording.

- **Not analyzed:** The recording has been processed and is available to view and edit, but it hasn't been marked as ready for analysis.

- **Ready to analyze:** The recording has been marked as ready for analysis and will be included in the report and analytics the next time you analyze the process.

- **Analyzed:** The recording has been analyzed and is included in the analytics output that can be viewed through the **Analytics** screen.

An analyzed recording might also have one of the following icons next to it:

- ![Not ready.](media/process-advisor-analyze/icon-not-ready.png "This recording is not ready") This icon indicates that the recording has been analyzed but has been marked not ready to analyze, and it won't be included if the process is analyzed again.

- ![Modified.](media/process-advisor-analyze/icon-modified.png "This recording has been modified") This icon indicates that the recording has been modified and may be out of sync with the previous analysis. If you analyze the process again, the recording will be synchronized with the analysis output and the process map.

[!INCLUDE[footer-include](includes/footer-banner.md)]
