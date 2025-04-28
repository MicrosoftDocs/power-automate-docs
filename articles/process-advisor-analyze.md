---
title: Analyze tasks and processes
description: Learn how to analyze processes with the task mining capability. The analyze feature adds a recording into the process map and associated analytics.
author: donums
contributors:
  - donums
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Analyze tasks and processes


You can access most of your tasks and process management activities in the task mining capability.

1. On the left navigation pane in Power Automate, select **Process mining** > **All Processes**.
1. Select your process to go to the **Details** screen.

> [!NOTE]
> The [TDS endpoint setting](/power-platform/admin/settings-features) for your organization needs to be enabled. This feature is enabled by default, but if it's disabled for any reason, ask your Microsoft Power Platform administrator to enable it in the Power Platform admin center.

## View your process map and related analytics

To begin analyzing your process, start by checking the status of your recordings and using **Analyze** on the command bar. This button adds the selected recording into the process map and related analytics. The analytics reports the insights only from recordings that have the **Analyzed** status.

- After the task is analyzed, the process map and related analytics are available when you select **Analytics** in the menu.

- On the **Details** pane, you can check the status of the analysis for your process and whether it has been previously analyzed.

    :::image type="content" source="./media/related-analytics.png" alt-text="Screenshot of the status in the Details pane.":::

- Analysis happens at the process level for all recordings that are ready to be analyzed.

- Pay attention to the recording status, which you can find under the Status column of the Recordings pane. Only recordings with the **Ready to analyze** status are considered for analysis.

Here's a short video on how to view analytics:<br>
</br>
> [!VIDEO https://learn-video.azurefd.net/vod/player?id=cc81da71-f071-4d12-80f4-e806464a4788 ]

## View your recording status

The status of each recording can be found under the Status column of the Recordings pane. Recordings can have one of the following statuses:

-**In progress:** This means that the recording is currently being made, or it might not have started yet. The web portal can't determine the status of the recording until it's been saved because the recording happens in the desktop client. Even after a recording has been saved, it's possible to see the "In progress" status because some processing is required to make the recording ready to view.

- **Failed:** An error occurred while processing the recording. You need to create a new recording.

- **Not analyzed:** The recording has been processed and is available to view and edit, but it hasn't been marked as ready for analysis.

- **Ready to analyze:** The recording has been marked as ready for analysis and is included in the report and analytics the next time you analyze the process.

- **Analyzed:** The recording has been analyzed and is included in the analytics output that can be viewed through the **Analytics** screen.

An analyzed recording might have one of the following icons next to it:


|Icon  |Description  |
|---------|---------|
|:::image type="content" source="media/process-advisor-analyze/icon-not-ready.png" alt-text="Screenshot of the Not ready icon.":::    | Indicates that the recording has been analyzed, but has been marked not ready to analyze. It won't be included if the process is analyzed again.        |
|:::image type="content" source="media/process-advisor-analyze/icon-modified.png" alt-text="Screenshot of the Modified icon.":::    | Indicates that the recording has been modified and might be out of sync with the previous analysis. If you analyze the process again, the recording is synchronized with the analysis output and the process map.        |


[!INCLUDE[footer-include](includes/footer-banner.md)]
