---
title: Case attributes conditional filter (preview)
description: Learn how to use the case attributes conditional filter in the Minit desktop application for Microsoft Power Automate process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 11/01/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case attributes conditional filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The **Attributes (conditional)** filter adds conditions to the **Attribute** filter. Use it, for example, to find all cases where an approval activity occurs, but only if a specific resource executed the approval or the duration of the activity exceeds a certain KPI.

1. Select the filter **Attributes (conditional)**.

    :::image type="content" source="media/image016-v52.png" alt-text="Screenshot of the Attributes (conditional) filter.":::

1. In the **and at the same time** list, select a criteria type, either **Attribute**, **Metric**, or **Process Metric**.

   :::image type="content" alt-text="Screenshot of specifying the additional criteria type." source="media/image017-v52.png":::

   **Process metric** calculates the total value for all cases in the process. In the view filtering, it returns either empty (0% cases) or full (100% cases) for data set coverage. It's reasonable to use process metrics for filters in business rules, where you can deactivate or activate the business rule by filtering out the whole data set.

1. Select an attribute, metric, or process metric and the corresponding value or values.

    :::image type="content" source="media/image017-v52-2.png" alt-text="Screenshot of specifying additional criteria for a metric.":::
