---
title: Case metrics filter (preview)
description: Learn how to filter cases based on metrics in the Minit desktop application in process advisor.
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

# Case metrics filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This case-level filter can be used to filter cases based on various metrics. The case count based on the selected metrics is visualized on the right. The number of intervals (for example, chart detail level), can be changed by the switch. You can select different types of metrics.

- **Case metric:** Evaluation of the case by the selected case metric.

- **Event metric:** Evaluation of the case when at least one or all events meet the event metric.

- **Edge metric:** Evaluation of the case when at least one or all edges meet the edge metric.

   :::image type="content" alt-text="Screenshot of the dropdown menu containing the types of metrics." source="media/casemetricselection-v52.png":::

In all types of metrics, you can select between standard default metrics found in Minit and custom metrics created within the process context.

## Select the case metric

The selection of the case metric and filter values represents a simpler form of the case metric filter.

:::image type="content" alt-text="Screenshot of the case metric and filter values." source="media/metric-v52.png":::

You can select from the following types of standard metrics:

- **Case duration:** Case duration, which is the time from case start to case finish.

- **Case active time:** Time during which an activity was in progress in the case, which is the total duration of all events in the case.

- **Case waiting time:** Total time without any ongoing activity in the case.

- **Case utilization:** Ratio of the time spent on an activity to the total duration of the case. Maximum case utilization is 1 (100%), which means that no waiting has occurred in the case.

- **Case cumulative utilization:** Ratio of the total time spent on activities to the total duration of a case.

- **Event count:** Number of events.

- **Self loop count:** Number of occurrences of activities in self loop.

- **Loop count:** Number of occurrences of activities involved in loops.

- **Rework count:** Value of rework count of all activities in the process.

- **Case cost:** Whenever one or more finance attributes are specified during the import process, they automatically become available as additional metrics filtering options.

Apart from the standard metrics, the dropdown menu automatically offers all custom metrics which meet the case metric requirements - see
[Custom metrics - Calculation context](calculation-context.md).

:::image type="content" alt-text="Screenshot of the dropdown menu with custom metrics." source="media/casemetricslist-v52.png":::

## Select the event and edge metrics

Selection of event or edge metric requires additional setting to specify validity of metric over all or at least one element (event or edge) in the case:

:::image type="content" alt-text="Screenshot of the additional setting of all or one for an event or edge metric." source="media/eventmetricsetting-v52.png":::

## Specify metrics values

You can specify the filtering values in two ways. You can either enter a range of values or use the slider. The examples in this section are valid for *Event count*.

To specify a range:

1. In the **is in range** field, enter the minimum value.

1. In the **and** field, enter the maximum value.

   :::image type="content" alt-text="Screenshot of filtering values." source="media/metric2.png":::

   As an alternative, you can select the range of values by dragging the sliders in the chart.

   :::image type="content" alt-text="Screenshot of the chart sliders for specifying a range." source="media/metric1.png":::

## Specify values in the Expression tab

The selection options differ according to the selected metrics type.

1. Go to to the **Expression** tab.

2. Select one of the available operators (for example, **Equal to**).
 
1. Specify the value.

   You can select **fx** again to use [custom metrics](custom-metrics.md).

   :::image type="content" alt-text="Screenshot of an expression." source="media/metric3.png":::


