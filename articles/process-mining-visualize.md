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

## Process map

The process map empowers you to visualize and gain insights from processes. By looking at a graphical representation of how your business processes are performed, you can glean insights about where opportunities exist.

Activities describe tasks or actions, the sequence of which makes up a business process. Activities can be performed by humans, or, in the case of automation—by machines. In the process map, different activities appear as nodes, and transitions between activities appear as edges. Each process sequence will have a start and an end.

Different activity combinations and *paths* are shown separately on the process map. A process path is a unique sequence from start to finish of the process. Each path differs from the others by at least one activity.

You can see more metrics on the process map, including the following.

- **Frequency**: The total number of workflows (also known as cases) passing through it.

- **Case duration**: The time between the first event of the case and the last.

- **Rework**: Encompasses all the self-loops and loops that are happening in your process.

- **Self-Loop**: The occurrence where an activity repeats itself.

- **Loop**: The occurrence where a sequence of activities has one or more activities repeated.

To learn more about the process map visual, go to [Process map overview (preview)](minit/process-map.md).

## Use KPIs and visualizations for analytics

You'll get several prebuilt KPIs and visualizations to help you to understand your process. You can filter by selectors, such as **Activity** and **Case Id**, and custom filters if you added the custom attributes (data columns) when you uploaded your data for analysis.

:::image type="content" source="media/process-mining-visualize/analytics.png" alt-text="Screenshot of the 'Summary' tab.":::

### KPIs

These KPIs are the same metrics that you see at the top of your report.

- **Median case duration**: The median case duration shows the center of all the case durations that are more resistant to outliers in the data.

- **Average Case Duration**: Shows the average case duration, which can be greatly affected by outliers in the data.

- **Self-Loop Cases %**: Percentage of cases that have an activity that repeats itself.

- **Loop Cases %**: Percentage of cases that have a sequence of activities that has at least one activity that is repeated.

- **Rework Cases %**: Percentage of cases that have either a Self-Loop or Loop.

- **Resource Count**: Count of how many resources are in the process.

To enlarge the view so you can dig deeper into your process, select the **Map** tab.

:::image type="content" source="media/process-mining-visualize/map-tab.png" alt-text="Screenshot of the 'Map' tab.":::

### Filter pane

To drill down into the process, use the filters in the filters dialog. To see the filters, select **Filters** in the upper-right side of the **Summary** tab.

:::image type="content" source="media/process-mining-visualize/filter-buttons.png" alt-text="Screenshot of the 'Filters' option.":::

The filters dialog contains the following filters:

- **Activity selector**: Allows you to select cases that contain the selected activity.

- **Case filter**: Allows you to see the process visualization and analytics filtered to the case.

- **Start date filter**: Allows you to see the process visualization in a particular period.

- **Custom attribute filters**: Allows you to filter on both your event and case level custom attributes for your process.

To select multiple activities or cases, you can also use **Ctrl** + **Click** .

:::image type="content" source="media/process-mining-visualize/filter-panel.png" alt-text="Screenshot of the filters dialog.":::

### Visualizations

- **Paths by frequency**: Shows which paths are the most common, sorted by the most common to the least common. You can select one or multiple paths in the bar chart to analyze details of the paths by filtering for them. This would update the process map, KPIs, and other visualizations. To select multiple variants, press **Ctrl** and select the desired paths.

- **Paths by time**: Shows a bar chart of the longest duration path to the shortest one. Filtering on specific paths updates the process map and KPIs so you could get insights into the behavior of the selected variants.

- **Average duration of cases over time**: Shows how duration of the process changes over time.

- **Average time spent by Activity**: Shows how much time on average is spent on the activity and which activities are being executed the most.

- **Activity by Month**: Shows how activities occur over time.

- **Case**, **Activity**, and **Path by Time Spent**: Shows average throughput time for case, activity and path.

:::image type="content" source="media/process-mining-visualize/visualizations.png" alt-text="Screenshot of the visualizations.":::

### Time Analysis

The **Time Analysis** view allows you to drill down into time bottlenecks by cases, variants, and activity. It also shows you average time spent per activity and how activities occur over time.

:::image type="content" source="media/process-mining-visualize/time-analysis.png" alt-text="Screenshot of the 'Time Analysis' view'.":::

### Variant DNA

To show the order of all the activities in each path sorted based on the paths that happen the most often, select the **Variant DNA** tab. The activities are color coded and abbreviated to quickly show a high-level view of the order of the activities that occur. This also helps identify non-compliant processes, self-loops, and loops quickly.

:::image type="content" source="media/process-mining-visualize/variant-dna.png" alt-text="Screenshot of the 'Variant DNA' tab'.":::