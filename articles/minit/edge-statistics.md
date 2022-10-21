---
title: Edge statistics (preview)
description: View edges in the process undergoing analysis and display their various properties in the Minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Edge statistics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

These statistics refer to edges in the process undergoing analysis and display their various properties. Edge statistics can be reviewed from the perspective of activities (process map-related edges) as well as from the viewpoint of resources (social chart-related edges).

You can select the desired attribute in the title of the view.

:::image type="content" alt-text="Screenshot of selecting the attribute in the title of the view." source="media/image011-3.png":::

### Statistical chart

The following metrics are available in the chart:

#### Case frequency

This item displays the total number of cases containing a particular edge in the process.

#### Case frequency (%)

This item displays the percentage of cases containing a particular edge in the process relative to all cases in the process.

#### Event frequency

This item displays the total number of each edge occurrence in the process.

#### Event frequency (%)

This item displays the percentage of each edge occurrence in the process relative to all edges.

#### Maximum occurrence in case

This item displays the largest number of edge repetitions in process instances.

#### Total duration

This item displays the total duration of each edge in the process.

#### Total duration (%)

This item displays the percentage of the total duration of each edge in the process relative to the total duration for all cases in the process.

#### Mean duration

This item displays the average duration of each edge in the process.

#### Mean duration (%)

This item displays the average duration of each edge in the process relative to the average duration for all cases in the process.

#### Minimum duration

This item displays the shortest duration of each edge in the process.

#### Maximum duration

This item displays the longest duration of each edge in the process.

#### Duration range

This item displays the difference between the longest and shortest duration of the occurrence of each edge for each edge in the process.

#### Duration std. dev.

This item displays the standard deviation of each edge duration in the process.

#### Self-loop count

This item displays the number of occurrences of self-loop edges.

#### Self-loop (%)

This item displays the percentage of occurrences of self-loop edges relative to their total occurrences in the process. For more detailed information on Rework-related metrics, please refer to the [Rework section](rework-metrics.md) of this Help.

#### Loop count

This item displays the number of occurrences of edges in loops.

#### Loop (%)

This item displays the percentage of occurrences of edges in loops relative to their total occurrences in the process.

#### Loop inflow

This item displays the value of the loop inflow of edges in the process.

#### Loop inflow (%)

This item displays the percentage of loop inflow of edges relative to their total occurrences in the process.

#### Loop outflow

This item displays the value of loop outflow of edges in the process.

#### Loop outflow (%)

This item displays the percentage of loop outflow of edges relative to their total occurrences in the process.

Besides these standard statistics, the list contains all defined case-level and edge-level custom metrics with the continuous output data type.

### Summary header and table of edges

The summary provides an overview of standard metrics provided by Minit. The list of these metrics is not configurable and no additional metrics can be included in this summary row. Table of edges contains standard edge-level metrics, and custom metrics applicable on case-level or edge-level. In the table, all mentioned custom metrics are available regardless of their discrete or continuous output data type.

:::image type="content" alt-text="media/edge-table.png" source="media/edge-table.png":::

The summary header contains the following metrics:

#### Edges

The total number of unique edges in the view.

#### Minimum frequency

The minimal number of occurrences of a given edge in a single case.

#### Maximum frequency

The maximum number of occurrences of a given edge in a single case.

#### Median frequency

The median number of occurrences of a given edge in a single case.

#### Mean frequency

The mean number of occurrences of a given edge in a single case.

#### Count std. deviation

The standard deviation of edge occurrences in a view.

#### Minimum duration, maximum duration

The global minimum and maximum duration of a single edge.

#### Mean duration

The average duration of edges.

#### Duration std. deviation

The standard deviation of edges durations in a view.

#### Self-loop events

Shows the percentage of self-loop edges relative to the total number of edges in the view. A self-loop edge is an edge with the same starting and ending node (activity).

#### Loop events

Shows the percentage of edges in loops relative to the total number of edges in the view. An edge is in the loop if its ending node (activity) is repeated within a case.

#### Rework events

Shows the percentage of edges in rework relative to the total number of edges in the view. Rework edge is edge either in a loop or in a self-loop.


