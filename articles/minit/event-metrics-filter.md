---
title: Event metrics filter (preview)
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Event metrics filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

This event level filter can be used to filter events based on various metrics. Only event metrics are applicable here:

:::image type="content" alt-text="media/eventmetricfilter-v52.png" source="media/eventmetricfilter-v52.png":::

You can choose between standard - **Default** metrics found in Minit and custom metrics created in the process context.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Specification of metrics values

You can specify the filtering values in different ways: either select a **Range** of values, **List** of values, or use **Expression**. Values selection depends on the type of selected metric.

When specifying the **Range**, you can enter the minimum and maximum values.

:::image type="content" alt-text="media/metric2-1.png" source="media/metric2-1.png":::

Or you can select the range of values by using the sliders in the chart.

:::image type="content" alt-text="media/metric1-1.png" source="media/metric1-1.png":::

The selection options differ according to the selected metrics type. The examples above are valid for *Event count*.

To define the values using list, switch to the **List** tab (if available). Select one or more values like with other types of filters.

:::image type="content" alt-text="media/metric4.png" source="media/metric4.png":::

To define the values using expression, switch to the **Expression** tab, select one of the available operators (e.g. equal to) and specify the value. You can further click on the **fx** button to use [custom metrics](custom-metrics.md).

:::image type="content" alt-text="media/metric3-1.png" source="media/metric3-1.png":::


