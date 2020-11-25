---
title: Analyze processes | Microsoft Docs
description: How to analyze processes in Process Advisor.
services: ''
suite: flow
documentationcenter: na
author: nijemcevic 
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/09/2020
ms.author: tatn
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Analyze processes

On the **Process Advisor (preview)** > **Processes** screen, select the name of the process to go to the process details screen. This is where most of your process management activities will occur.

## Analyze feature

Perhaps the most important thing you will do here is to view the status of the recordings and analyze the process. You do that by selecting **Analyze** in the command bar.

- Once the process is analyzed, the process map and related analytics can be viewed by selecting **Analytics** in the command bar.
- The process status in the **Details** pane will let you know the status of the analysis and whether the process has been analyzed before.
- Analysis happens at the process level for all recordings that are ready to be analyzed.
- Pay attention to the recording status, which you can find under the **Status** column of the **Recordings** pane, only recordings with specific status will be considered for analysis.

## Recording status

Each recording can have one of the following statuses:

- **In progress**: recording is in progress, but it is also possible that the recording has not yet started. Since recording happens in the desktop client, the web portal will not know about its status until it has been saved. It is also possible to see this status after recording has been saved since some processing is required after recording to make it ready to view.
- **Failed**: an error occurred during recording processing. Please create a new recording.
- **Not analyzed**: the recording has been processed, and is available to view and edit, but it has not been marked as ready to analyze.
- **Ready to analyze**: the recording has been marked as ready to analyze and will be considered the next time you analyze the process.
- **Analyzed**: the recording has been analyzed and is part of the analyzed output that can be viewed through the **Analytics** screen.

In addition, analyzed recordings may have one of the following icons next to it:

- ![Not ready](media/process-advisor-analyze/icon-not-ready.png "This recording is not ready") indicates that even though the recording was analyzed, it has been marked not ready to analyze, and will not be included if the process is analyzed again.
- ![Modified](media/process-advisor-analyze/icon-modified.png "This recording has been modified")indicates that the recording has been modified and may be out of sync with the previous analysis. Analyzing again will synchronize the recording with the analysis output and the process map.

## See also

