---
title: Activities (event-level) statistics (preview)
description: Learn about statistics for process activities (events) in the Minit desktop application for Microsoft Power Automate process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/28/2022
ms.author: tatn
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Activities (event-level) statistics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Minit provides statistics at the level of activities, or events, in both chart and table form. You can customize many aspects of both the chart and the tabular data that's displayed.

:::image type="content" source="media/activity-stats-page.png" alt-text="Screenshot of the activity or event-level statistics page in the Minit desktop application.":::

Legend:

1. Select the level and attribute to display.
1. Filter the data to display.

    :::image type="content" source="media/activity-stats-filter.png" alt-text="Screenshot of the activity statistics filter.":::

1. Statistical chart
1. Table summary row
1. Table of activities
1. Hide or show columns in the table and the table summary row.
1. Export the statistical data as a .png file or a .csv file.

## Statistical chart and table of activities

The following table describes the metrics that are available in the chart and the table of activities.

| Item | Description |
| ---  | --- |
| Case frequency | The number of cases in which an activity occurs |
| Case frequency (%) | The percentage of cases in which an activity occurs relative to all cases in the process |
| Event frequency | The number of times an activity occurs in the process |
| Event frequency (%) | The percentage of occurrences of an activity relative to all activities in the process |
| Maximum repetitions | The largest number of activity repetitions in process instances |
| Total duration | The total duration of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Total duration (%) | The percentage of the total duration of each activity relative to the total duration of all cases in the process; available only if two timestamps are recorded in the data and imported with the process |
| Mean duration | The average duration of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Mean duration (%) | The percentage of each activity's average duration relative to the average duration of all cases in the process; available only if two timestamps are recorded in the data and imported with the process |
| Minimum duration | The shortest duration of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Maximum duration | The longest duration of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Duration range | The difference between the longest and shortest duration of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Duration standard deviation | The standard deviation of each activity in the process; available only if two timestamps are recorded in the data and imported with the process |
| Self-loop count | The number of self-loops on an activity |
| Self-loop (%) | The percentage of self-loops on an activity relative to the total occurrence of that activity in the process |
| Loop count | The number of times an activity is involved in a loop |
| Loop (%) | The percentage of involvements of an activity in a loop relative to the total occurrence of that activity in the process |
| Rework count | The number of times an activity involved [rework](rework-metrics.md) |
| Rework (%) | The percentage of involvements of an activity in rework relative to the total occurrence of that activity in the process |
| Loop inflow | The value of loop inflow of an activity in the process |
| Loop inflow (%) | The percentage of loop inflow of an activity relative to the total occurrence of that activity in the process |
| Loop outflow | The value of loop outflow of an activity in the process |
| Loop outflow (%) | The percentage of loop outflow of an activity relative to the total occurrence of that activity in the process |
| Net loop gain | The value of net loop gain of an activity in the process |
| Net loop gain percentage | The percentage of net loop gain of an activity relative to the total occurrence of that activity in the process |

Along with these standard statistics, the chart displays all event-level custom metrics that have the continuous output data type.

The table of activities displays event-level standard and custom metrics. In the table, all event-level custom metrics are available, whether their output data type is discrete or continuous.

You can't add metrics to the table. However, you can hide those you don't need to view. Select the hamburger menu at the right side of the table header row, and then select or clear the selection of columns to customize your view of the summary.

:::image type="content" source="media/activity-stats-table-columns-2.png" alt-text="Screenshot of the table column selection panel.":::

## Table summary row

The table summary row provides a summary overview of the standard metrics that Minit provides.

You can't add metrics to the summary row. However, you can hide those you don't need to view. Select the hamburger menu at the right side of the summary row, and then select or clear the selection of columns to customize your view of the summary.

:::image type="content" source="media/activity-stats-table-columns.png" alt-text="Screenshot of the table column selection panel.":::

The following table describes the metrics that are available in the summary row.

| Item | Description |
| ---  | --- |
| Activities (value) | The total number of unique values for activities or event-level attributes<br>The Activity attribute is defined during process import and configuration and isn't affected by the selection of mining attribute on the process map. |
| Minimum frequency | The smallest number of occurrences of a given activity (attribute value) in a single case |
| Maximum frequency | The largest number of occurrences of a given activity (attribute value) in a single case |
| Median frequency | The median number of occurrences of a given activity (attribute value) in a single case |
| Mean frequency | The mean number of occurrences of a given activity (attribute value) in a single case |
| Count std. deviation | Standard deviation of activity (attribute value) occurrences in a view |
| Minimum duration and maximum duration | The global minimum and maximum duration of a single event |
| Mean duration | The average duration of events |
| Duration standard deviation | Standard deviation of activity (attribute value) durations in a view |
| Self-loop events | The percentage of events in self-loops relative to the total number of events in the view |
| Loop events | The percentage of events in loops relative to the total number of events in the view |
| Rework events | The percentage of events in rework relative to the total number of events in the view |
