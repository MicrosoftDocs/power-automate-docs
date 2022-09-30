---
title: Case Metrics filter
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case Metrics filter

This case-level filter can be used to filter cases based on various metrics. The case count based on the selected metrics is visualized on the right. The number of intervals, i.e. chart detail level, can be changed by the switch. The user can select between different types of metrics:

- Case metric - evaluation of the case by the selected case metric.

- Event metric - evaluation of the case based on the fact that at least one or all events meet the event metric.

- Edge metric - evaluation of the case based on the fact that at least one or all edges meet the edge metric.

:::image type="content" alt-text="media/casemetricselection-v52.png" source="media/casemetricselection-v52.png":::

In all types of metrics, the user can select between standard - **Default** metrics found in Minit and custom merics created within the process context.

## Case metric

The selection of the case metric and filter values represents simpler form of the Case Metric filter.

:::image type="content" alt-text="media/metric-v52.png" source="media/metric-v52.png":::

You can select from the following types of standard metrics:

- Case duration – case duration (the time from case start to case finish)

- Case active time – the time during which an activity was in progress in the case (the total duration of all events in the case)

- Case waiting time – the total time without any ongoing activity in the case

- Case utilization – the ratio of the time spent on an activity to the total duration of the case. Maximum case utilization is 1 (100%), which means that no waiting has occurred in the case

- Case cumulative utilization – the ratio of the total time spent on activities to the total duration of a case.

- Event count – the number of events

- Self loop count – the number of occurrences of activities in self loop

- Loop count – the number of occurrences of activities involved in loops

- Rework count – the value of rework count of all activities in the process

- Case cost – whenever one or more finance attributes are specified during the import process, they automatically become available as additional metrics filtering options

Apart from the standard metrics, the dropdown automatically offers all custom metrics which meet the case metric requirements - see
[Custom metrics - Calculation context](calculation-context.md).

:::image type="content" alt-text="media/casemetricslist-v52.png" source="media/casemetricslist-v52.png":::

## Event & Edge metrics

Selection of event or edge metric requires additional setting to specify validity of metric over all or at least one element (event or edge) in case:

:::image type="content" alt-text="media/eventmetricsetting-v52.png" source="media/eventmetricsetting-v52.png":::

## Specification of metrics values

You can specify the filtering values in two ways - you can either select a **Range** of values or use **Expression**.

When specifying a **Range**, you can enter the minimum and maximum values.

:::image type="content" alt-text="media/metric2.png" source="media/metric2.png":::

Or you can select the range of values by using the sliders in the chart.

:::image type="content" alt-text="media/metric1.png" source="media/metric1.png":::

The selection options differ according to the selected metrics type. The examples above are valid for *Event count*.

To define the values using expression, switch to the **Expression** tab, select one of the available operators (e.g. equal to) and specify the value. You can further click on the **fx** button to use [custom metrics](custom-metrics.md).

:::image type="content" alt-text="media/metric3.png" source="media/metric3.png":::


