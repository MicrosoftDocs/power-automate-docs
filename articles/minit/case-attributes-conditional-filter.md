---
title: Case attributes conditional filter
description: Learn how to use the case attributes conditional filter in Power Automate Process Mining.
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
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Case attributes conditional filter

The **Attributes (conditional)** filter adds conditions to the **Attribute** filter. Use it, for example, to find all cases where an approval activity occurs, but only if a specific resource executed the approval or the duration of the activity exceeds a certain KPI.

1. On the left panel, select your attributes (conditional) filter.

1. In the **Filter result** dropdown menu, select if the cases you select for the filter should or shouldn't be included.

1. In the **cases in which attribute** dropdown menu, select an attribute.

1. In the **holds any of the values** dropdown menu, select one or more values in the **List** tab to the right.

1. In the **and at the same time** dropdown menu, select a criteria type, either **Attribute**, **Metric**, or **Process Metric**.

    If you select **Metric** or **Process Metric**, you'll need to complete additional fields. To learn more, go to [Process metric](#process-metric) in this article.

1. In the next dropdown menu, select an attribute or metric.

1. Based on the characteristics of the selected attribute or metric, complete the filtering criteria using the offered controls or use the **Expression** tab, select an operator, and enter a value.

1. Select **Apply**.

   :::image type="content" alt-text="Screenshot of specifying the additional criteria type." source="media/attributes-conditional-filter.png":::

## Process metric

   Process metric calculates the total value for all cases in the process. In the view filtering, it returns either empty (0% cases) or full (100% cases) for data set coverage. Use process metrics for filters in business rules, where you can deactivate or activate the business rule by filtering out the whole data set.
