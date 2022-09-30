---
title: Edge (conditional) filter
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

# Edge (conditional) filter

This case-level filter is similar to the Attribute (conditional) filter, only it is related to edges (instead of events). Both Activity-Based Process Map as well as Resource-Based Social Chart edges are supported. This is the first selection - process map based attribute:

:::image type="content" alt-text="media/image052-v52.png" source="media/image052-v52.png":::

If there are defined resource attributes in the active process, the dropdown offers to select Resource attributes:

:::image type="content" alt-text="media/image053-v52.png" source="media/image053-v52.png":::

As we are dealing with edges, the available condition is limited to either Case-Level Attributes or edge-related metrics. E.g. you want to find all cases where edge Approving -> Demand for information occurs, but only those where this edge happened for a certain Supplier or Region, or the mean duration of this edge exceeds a certain KPI. (If we used Resource-Based attribute, the list of edges follows resource transitions e.g. Lara Obrien -> Azalia Hansen.)

To do that, select the additional criteria type Case-Level Attribute/Edge Metric/Process metric:

:::image type="content" alt-text="media/image050-v52.png" source="media/image050-v52.png":::

And specify the value(s) for it:

:::image type="content" alt-text="media/image051.png" source="media/image051.png":::


