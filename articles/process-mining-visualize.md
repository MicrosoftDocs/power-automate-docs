---
title: Visualize and gain insights from processes in process advisor (preview) (contains video) | Microsoft Docs
description: This topic explains how to visualize and gain insights from processes with process mining in the process advisor feature in Power Automate.
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

# Visualize and gain insights from processes in process advisor (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

This topic explains metrics and visuals, and what they could tell you about your process.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Process map

The process map empowers you to visualize and gain insights from processes. By looking at a graphical representation of how your business processes are performed, you can glean insights about where opportunities exist.

Activities describe tasks or actions, the sequence of which makes up a business process. Activities can be performed by humans, or, in the case of automation—by machines. In the process map, different activities appear as nodes, and transitions between activities appear as edges. Each process sequence will have a start and an end.

Different activity combinations and *paths* are shown separately on the process map. A process path is a unique sequence from start to finish of the process. Each path differs from the others by at least one activity.

You can see more metrics on the process map, like *frequency* of the activities, and process throughput time (*case duration*), and *rework*.

Frequency shows you the total number of workflows (also known as cases) passing through it. *Case duration* is the time between the first event of the case and the last. *Rework* encompasses all the self-loops and loops that are happening in your process. A *self-Loop* is the occurrence where an activity repeats itself. A *loop* is the occurrence where a sequence of activities has one or more activities repeated.

To learn more about the process map visual, go to [Process map overview (preview)](minit/process-map.md).

## Use KPIs and visualizations for analytics 

You'll get several prebuilt KPIs and visualizations to help you to understand your process. You can filter by selectors, such as **Activity)** and **Case Id**, and custom filters (if you added the custom attributes (data columns) when you uploaded your data for analysis.

:::image type="content" source="media/process-mining-visualize/analytics.png" alt-text="Screenshot of Browse OneDrive.":::