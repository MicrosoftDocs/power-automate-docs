---
title: Case attributes conditional filter (preview)
description: Learn how to use the case attributes conditional filter in Minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case attributes conditional filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This filter enhances the **Attribute** filter with additional criteria. For example, you still want to find all cases where activity approval occurs, but only those where this approval was executed by a specific resource or the duration of this approval exceeds a certain KPI.

1. Select the additional criteria type Attribute/Metric/Process Metric.

   :::image type="content" alt-text="Screenshot of the additional criteria type screen." source="media/image016-v52.png":::

   Process metric option calculates results not per a single case, but total value for all case in the existing process. In the View filtering, it returns either empty (0% cases) or full (100% cases) data set coverage. The usage of Process metrics is reasonable for filters in Business rules. It's possible to deactivate or activate the business rule by filtering out the whole data set.

1. Specify the value or values, or custom expression for it.

   :::image type="content" alt-text="Screenshot of values or expressions." source="media/image017-v52.png":::




