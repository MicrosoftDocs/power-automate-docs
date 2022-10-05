---
title: Rework metrics (preview)
description: Learn about rework metrics types and more in the minit desktop application in process advisor.
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

# Rework metrics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Rework metrics represent a layer of data analysis with a focus on identifying various kinds of repetitions found in a process. Rework information is covered in Statistics and can be visualized on the Process map for better understanding the root cause of each repetition and its overall impact. Reducing repetitions is crucial for improving the efficiency of the process as well as reducing costs.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

## Types of rework metrics

The following sections list the types of rework metrics.

### Self-loop

Self-loop represents a specific repetition where an activity is directly followed by the same activity. In terms of edges/transitions, the starting and ending activity of edge is the same.

**Example:** The activity called *BP Transfer* repeats itself 9 times. There are zero values over all the other activities/edges because no other activities are involved in this type of repetition.

:::image type="content" alt-text="media/example1-v56.png" source="media/example1-v56.png":::

### Loop

Loop represents specific repetition where activity is followed by the same activity, but not directly, i.e. at least one additional activity is always involved.

**Example:** Activities *SetDeliveryDate* and *Approve* are repeated 7 times. The edge between these two activities is also repeated 7 times. Keep in mind that in a process map, an activity may be repeated, but each time a different edge/transition can be used. Loop count value for non-repeated edge is zero, regardless of loop count for starting or ending activity of the edge.

:::image type="content" alt-text="media/example2-v56.png" source="media/example2-v56.png":::

### Rework

Rework count represents the sum of all self-loops and loops.

**Example:** The number of self-loops of the activity *BP Transfer* is displayed together with the number of loops of the activities *SetDeliveryDate* and *Approve*. If any of the activities contained both self-loops and loops, their numbers would add up.

:::image type="content" alt-text="media/example3-v56.png" source="media/example3-v56.png":::

### Loop inflow

Loop inflow represents the repetitions of an activity's predecessors.

**Example:** In this example, the activity *SetDeliveryDate* has been repeated 7 times, so the loop inflow for the activity *Approve* is also 7, as *SetDeliveryDate* is the only predecessor of *Approve*.

:::image type="content" alt-text="media/example4-v56.png" source="media/example4-v56.png":::

As the activity *SetDeliveryDate* has been preceded by non-repeated activities, its loop inflow value is zero, regardless of the number of repetitions of itself. However, the edge between *SetDeliveryDate* and *Approve* has a non-zero value as the starting activity was repeated.

### Loop outflow

Loop outflow represents the repetitions of an activity's successors.

**Example:** The activity *Approve* has the value of zero, none of the successor activities was repeated. *SetDeliveryDate* shows value 7, as activity's *Approve* loop count equals 7. The edge between *SetDeliveryDate* and *Approve* shows value 7, as the ending edge activity *Approve* has been repeated 7 times.

:::image type="content" alt-text="media/example5-v56.png" source="media/example5-v56.png":::

### Net Loop Gain

This activity metric represents the difference between *Loop outflow* and *Loop inflow*. If the value is positive, the activity is directly followed by more repeated activities than it was preceded. Such activities start new loops in processes. If the value is negative, the activity is directly followed by less repeated activities than it was preceded. Such activities end, close, or exit loops in processes. The halo effect color also helps us see positive and negative trends in the process - red color represents a problem (start of new loops); the blue color represents a favorable change (end of loops).

**Example:** *SetDeliveryDate* is followed by repeated activity *Approve* while it has no repeated predecessors (value 0). The activity is thus involved in the creation of 7 new loops (value 7). Activity *Approve* is not followed by a repeated activity (value 0), but its predecessors are repeated 7 times. The activity *Approve* is thus involved in closing 7 loops (value -7).

:::image type="content" alt-text="media/example6-v56-1.png" source="media/example6-v56-1.png":::

## Rework metrics - process map

To display the rework information, open the Customize panel and select **Rework**. The map displays information representing the volume of repetitions for activities and edges the process involves.

Using the clip icon, you can select if one metric is used both for activities and edges, or each metric is set separately. You can click on the **%** sign to switch between count and percentage for each metric.

:::image type="content" alt-text="media/image000-v45.png" source="media/image000-v45.png":::

The list of metrics is the same for both activities and edges, with one exception. Metric **Net Loop Gain** is available only for activities.

:::image type="content" alt-text="media/image001-v56.png" source="media/image001-v56.png":::

By clicking on an activity or edge, you can display rework details about the particular object. The percentage represents the proportion of the individual types of reworks to the overall number of instances.

:::image type="content" alt-text="media/detail-v56-1.png" source="media/detail-v56-1.png":::

## Rework metrics - statistics

In the Statistics section, the rework information is available for Case overview, Activities, Edge statistics, Resources, and all event-level attribute statistics.

The rework columns are located at the far-right end of the table and the information can be also displayed in the chart. The percentage is calculated from the Event frequency value (in case of Case overview from the Event count).

:::image type="content" alt-text="media/image-54.png" source="media/image-54.png":::

Information about reworks is also present in the overview bar. The percentage shows the proportion of the displayed rows that contain self-loops, loops, and reworks. In the following example, one out of two cases contains a self-loop so the overview bar shows 50% Avg. self-loop. Similarly, one out of the two contains a loop, hence Avg. loop shows 50%. This means that both cases contain a rework, so Avg. rework shows 100%.

:::image type="content" alt-text="media/statistics2-1.png" source="media/statistics2-1.png":::

In this example, one case contains one self-loop and one loop. The other one does not contain any reworks. Thus the displayed Avg. self-loops, Avg. loops and Avg. reworks is 50% because only one of the two cases contain them.

:::image type="content" alt-text="media/statistics3.png" source="media/statistics3.png":::

## Rework metrics - filters

The Metrics filter supports filtering per case according to the amount of self-loops, loops and reworks.

:::image type="content" alt-text="media/image-55.png" source="media/image-55.png":::

Filters Attributes (conditional) and Edge (conditional) allow using rework metrics filter per event.

:::image type="content" alt-text="media/image-56.png" source="media/image-56.png":::
