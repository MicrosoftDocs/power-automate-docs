---
title: Event metrics filter (preview)
description: Learn how to filter events based on various metrics in the Minit desktop application in process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Event metrics filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This event level filter can be used to filter events based on various metrics. Only event metrics are applicable here.

You can choose between standard default metrics found in Minit and custom metrics created in the process context.

:::image type="content" alt-text="Screenshot of default and custom event metrics dropdown menu." source="media/eventmetricfilter-v52.png":::

## Specify metrics values

You can specify the filtering values in different ways: either select a **Range** of values, **List** of values, or use **Expression**. Values selection depends on the type of selected metric.

When specifying the **Range**, you can enter the minimum and maximum values.

:::image type="content" alt-text="Screenshot of metric range fields." source="media/metric2-1.png":::

Or you can select the range of values by using the sliders in the chart.

:::image type="content" alt-text="media/metric1-1.png" source="media/metric1-1.png":::

The selection options differ according to the selected metrics type. The examples above are valid for *Event count*.

To define the values using list, switch to the **List** tab (if available). Select one or more values like with other types of filters.

:::image type="content" alt-text="Screenshot of metric range sliders." source="media/metric4.png":::

To define the values using expression, switch to the **Expression** tab, select one of the available operators (for example, equal to) and specify the value. You can further select **fx** to use [custom metrics](custom-metrics.md).

:::image type="content" alt-text="Screenshot of metric values in the List tab." source="media/metric3-1.png":::


