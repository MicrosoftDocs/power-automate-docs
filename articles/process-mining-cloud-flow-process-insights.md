---
title: Improve cloud flows with process insights (preview)
description: Learn how to improve your cloud flows with process insights in the process mining capability in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie 
  - tatn
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Improve cloud flows with process insights (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

The process mining capability can help you gain valuable insights and optimize your cloud flows. You can visualize your flow's performance, identify bottlenecks and opportunities for improvement, and monitor for performance drifts. By utilizing the process mining capability to analyze your flow's run history with process mining techniques, you can generate these insights directly from the flow details page.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

To generate process insights, you must meet the following prerequisites:

- Flow runs must have been generated within the last 28 days.
- Only the owner of a flow has the ability to generate process insights.
- You must have access to Microsoft Dataverse (i.e., a low-code data platform that allows you to store and manage data for your applications)
- You must have the environment maker role.

## Known limitations

Please note the following known limitations of this feature:

- After a flow runs, it may take approximately 15 to 30 minutes for data to be added for analysis. However, historical runs up to 28 days are immediately available for analysis.
- This feature is not currently supported for Dataverse for Microsoft Teams environments.
- Cloud flow analytics for your older flows might not appear immediately in the Process Mining desktop application. To have the analytics appear, select **Improve your flow** on the details page of your flow.

## Terminology

To better understand the process insights feature, it's helpful to be familiar with the following terminology:

- Flow runs are referred to as 'cases' in the report, while actions are represented as 'activities'.
- A path is a specific sequence of activities, representing a 'trace' through the process from start to end. Each path differs from the others by at least one activity.
- Custom metrics and filters enable you to generate personalized insights based on criteria such as flow version or successful versus failed flow runs.

## Improve your flow with process insights

On your flow details page, you can see the **Process insights** card. To see your flow process visualization and analytics, select **Improve your flow**.
  
1. Go to your flow details page.

1. Generate flow runs if the flow hasn't run in the last 28 days.

1. On the **Process mining (preview)** tile, select **Improve your flows**.

    :::image type="content" source="media/process-mining-cloud-flow-process-insights/improve-flow.png" alt-text="Screenshot of the flow details page.":::

1. Wait for analysis to complete.

    When analysis completes, the flow process analytics screen displays.

    :::image type="content" source="media/process-mining-cloud-flow-process-insights/flow-process-analytics.png" alt-text="Screenshot of the flow process analytics.":::

1. To get the most common run path in your automation, select the most frequent variant.

1. Customize your insights based on custom filters for your flow like flow version, action status, action status code, or action error.

1. Select time analysis report to drill down into bottlenecks based on cases, variants, and time.

> [!NOTE]
> To re-analyze the process based on your latest flow runs, go to the analytics page and select **Refresh**. This updates your data and re-analyzes the process. You can continue viewing the analytics while the analysis is processing.
