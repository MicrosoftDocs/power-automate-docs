---
title: Event metrics filter
description: Learn how to filter events based on various metrics in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Event metrics filter

Use this event level filter to filter events based on various metrics. Only event metrics are applicable here.

:::image type="content" alt-text="Screenshot and the custom metrics filter." source="media/event-metrics-filter.png":::

## Specify metrics values

You can specify the filtering values in different ways. Value selection depends on the type of selected metric.

When specifying the range in the **is in range/and** fields, you can enter the minimum and maximum values. Alternatively, you can select the range of values by using the sliders in the chart.

The selection options differ according to the selected metrics type.

To define the values using an expression, select the **Expression** tab, select one of the available operators (for example, **Equal to**) and enter the value. You can also select **fx** to use [custom metrics](custom-metrics.md).

## Create a custom metric

You can choose between standard default metrics found in the Power Automate Process Mining desktop app and custom metrics created in the process context. To create a custom metric, select (**...**) > **Add**.
