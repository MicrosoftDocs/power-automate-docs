---
title: Gain insights from cloud flow processes in process advisor (preview) | Microsoft Docs
description: This topic describes how to gain insights and improve your cloud flows with the help of process mining in the process advisor feature in Power Automate.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.date: 05/18/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Gain insights from cloud flow processes (preview)

You can gain insights and improve your cloud flows with the help of process mining. With a few easy selections, you can visualize your flow’s performance, identify bottlenecks and optimization opportunities, and monitor for business drifts. You can generate these insights directly from the flow details page by having a process advisor analyze your flow-run history with process mining techniques.

On your flow details page, you can see a process insights card. When you engage with it, you'll be taken to the process advisor analytics page to see your flow process visualization and analytics.

## Prerequisites

- Flow runs generated in the last 28 days.

- Owner of flow to generate process insights.

- Access to Microsoft Dataverse.

## Known limitations

- After a flow run, it takes about 15 to 30 minutes for data to be available for analysis.

- The feature is not supported for Dataverse for Microsoft Teams environments.

## Terminology

- The flow runs translate to the cases shown in analytics view

- A process variant is a specific activity sequence, like a "trace" through the process, from start to end. Each variant differs from the others by at least one activity. In case of flow, each action is an activity.

- Custom metrics/filters allow you to generate custom insights like based on your flow version or successful versus failed flow run.

## Step-by-step tutorial
  
1. Go to your flow details page.

1. Generate flow runs if the flow has not run in the last 28 days.

    > [!div class="mx-imgBorder"]
    > ![!Screenshot of the Desktop Flows tile.](media/process-mining-cloud-flow-process-insights/cloud-flow-details.png)

1. On the process advisor tile, select **improve your workflows**.

1. Wait for analysis to complete.

    > [!div class="mx-imgBorder"]
    > ![!Screenshot of the Desktop Flows tile.](media/process-mining-cloud-flow-process-insights/analyze-process.png)

1. Display flow process analytics.

    > [!div class="mx-imgBorder"]
    > ![!Screenshot of the Desktop Flows tile.](media/process-mining-cloud-flow-process-insights/flow-process-analytics.png)

1. To get the most run path in your automation. select the most frequent variant.

1. Customize your insights based on custom filters for your flow like flow version, action status, action status code, or action error.

1. Select time analysis report to drill down into bottlenecks based on cases, variants, and time.
