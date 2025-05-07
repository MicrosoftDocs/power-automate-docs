---
title: Case metrics filter
description: Learn how to filter cases based on metrics in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Case metrics filter

This case-level filter can be used to filter cases based on various metrics. The case count based on the selected metrics is visualized on the right. The number of intervals (for example, chart detail level), can be changed by the switch. You can select different types of metrics.

- **Case metric:** Evaluation of the case by the selected case metric.

- **Event metric:** Evaluation of the case when at least one or all events meet the event metric.

- **Edge metric:** Evaluation of the case when at least one or all edges meet the edge metric.

In all types of metrics, you can select between standard default metrics found in the Power Automate Process Mining desktop app and custom metrics created within the process context.

## Select the case metric

The selection of the case metric and filter values represents a simpler form of the case metric filter.

:::image type="content" alt-text="Screenshot of the case metric and filter values." source="media/case-metric-filter.png":::

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

Apart from the standard metrics, the dropdown menu automatically offers all custom metrics which meet the case metric requirements. To learn more, go to [Calculation context](calculation-context.md).

## Select the event and edge metrics

Selection of event or edge metric requires additional setting to specify validity of metric over all or at least one element (event or edge) in the case:

You can specify the filtering values in two ways. You can either enter a range of values or use the slider. The examples in this section are valid for *Event count*.

To specify a range:

1. In the **is in range** field, enter the minimum value.

1. In the **and** field, enter the maximum value.

   As an alternative, you can select the range of values by dragging the sliders in the chart.

    :::image type="content" alt-text="Screenshot of the chart sliders for specifying a range." source="media/event-sliders.png":::

## Specify values in the Expression tab

The selection options differ according to the selected metrics type.

1. Go to the **Expression** tab.
1. From the dropdown menu, select one of the operators (for example, **Equal to**).
1. Enter the value.
   You can select ***fx*** again to use [custom metrics](custom-metrics.md).

