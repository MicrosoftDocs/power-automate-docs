---
title: Case attributes conditional filter (preview)
description: Learn how to use the case attributes conditional filter in the Minit desktop application for Microsoft Power Automate process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 10/15/2022
ms.author: tatn
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

1. In the **and at the same time** list, select the additional criteria type, either **Attribute**, **Metric**, or **Process Metric**.

   :::image type="content" alt-text="Screenshot of specifying the additional criteria type." source="media/image017-v52.png":::

   Process metric option calculates results not per a single case, but total value for all case in the existing process. In the View filtering, it returns either empty (0% cases) or full (100% cases) data set coverage. The usage of Process metrics is reasonable for filters in Business rules. It's possible to deactivate or activate the business rule by filtering out the whole data set.

1. Specify the value or values, or custom expression for it.

   :::image type="content" alt-text="Screenshot of values or expressions." source="media/image017-v52.png":::
