---
title: Analyze processes | Microsoft Docs
description: How to use the analyze processes feature in process advisor.
author: nijemcevic 
ms.service: power-automate
ms.topic: article
ms.date: 5/25/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Analyze processes

In the navigation pane on the left in Power Automate, select **Process advisor** > **Processes**, and then select your process to go to the **Details** screen. This is where you access most of your process management activities.

> [!NOTE]
> The [TDS endpoint setting](/power-platform/admin/settings-features) for your organization needs to be enabled. This feature is enabled by default, but if it's disabled for any reason, contact your Microsoft Power Platform administrator to enable it in the Microsoft Power Platform admin center.

Some key things to do here are to view the status of the recordings and analyze your process. The **Analyze** option in the menu gets you started. The analyze feature adds a selected recording into the Process Map and associated analytics. If a recording’s status isn't *analyzed*, it won't be part of the analytics reports.

- After the process is analyzed, the process map and related analytics are available when you select **Analytics** in the menu.
- The process status on the **Details** pane shows the status of the analysis and whether the process has been analyzed before.
- Analysis happens at the process level for all recordings that are ready to be analyzed.
- Pay attention to the recording status, which you can find under the **Status** column of the **Recordings** pane. Only recordings with specific status will be considered for analysis.

Here's a short video on how to view analytics using process advisor: [Analyze feature](https://go.microsoft.com/fwlink/?linkid=2147426)

## Recording status

Each recording can have one of the following statuses:

- **In progress**&mdash;Recording is in progress, but it's also possible that the recording hasn't yet started. Since recording happens in the desktop client, the web portal won't know about its status until it has been saved. It's also possible to see this status after recording has been saved since some processing is required after recording to make it ready to view.
- **Failed**&mdash;An error occurred during recording processing. Please create a new recording.
- **Not analyzed**&mdash;The recording has been processed, and is available to view and edit, but it hasn't been marked as ready to analyze.
- **Ready to analyze**&mdash;The recording has been marked as ready to analyze and will be considered the next time you analyze the process.
- **Analyzed**&mdash;The recording has been analyzed and is part of the analyzed output that can be viewed through the **Analytics** screen.

Also, analyzed recordings might have one of the following icons next to it:

- ![Not ready](media/process-advisor-analyze/icon-not-ready.png "This recording is not ready") Indicates that even though the recording was analyzed, it's been marked not ready to analyze, and won't be included if the process is analyzed again.
- ![Modified](media/process-advisor-analyze/icon-modified.png "This recording has been modified") Indicates that the recording has been modified and might be out of sync with the previous analysis. Analyzing again will synchronize the recording with the analysis output and the process map. 

[!INCLUDE[footer-include](includes/footer-banner.md)]
