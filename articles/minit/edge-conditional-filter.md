---
title: Edge conditional filter
description: Learn how to use the edge conditional filter in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Edge conditional filter

This case-level filter is similar to the attribute (conditional) filter, only it's related to edges instead of events. Both activity-based process map and resource-based social chart edges are supported. **Activity attribute name** is the first process map based attribute.

If there are defined resource attributes in the active process, the dropdown offers to select Resource attributes.

As we are dealing with edges, the available condition is limited to either case-Level attributes or edge-related metrics. For example, you want to find all cases where edge Approving -> Demand for information occurs, but only those where this edge happened for a certain supplier or region, or the mean duration of this edge exceeds a certain KPI. (If we used a resource-based attribute, the list of edges follows resource transitions, such as Lara Obrien -> Azalia Hansen.)

1. Select the additional criteria type (**Case-Level Attribute**, **Edge Metric**, or **Process metric**):

    :::image type="content" alt-text="Screenshot of the Case-Level Attribute/Edge Metric/Process metric selection." source="media/edge-same-time.png":::

1. Complete the filter by specifying the values for it.

