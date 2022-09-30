---
title: Case Attributes (conditional) filter
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

# Case Attributes (conditional) filter

This filter enhances the Attribute filter with additional criteria based on other attribute or metrics. E.g. you still want to find all cases where activity Approval occurs, but only those where this Approval was executed by a specific resource or the duration of this Approval exceeds a certain KPI.

To do that, select the additional criteria type Attribute/Metric/Process Metric:

:::image type="content" alt-text="media/image016-v52.png" source="media/image016-v52.png":::

Process metric option calculates results not per a single case, but total value for all case in the existing process. In the View filtering, it returns either empty (0% cases) or full (100% cases) data set coverage. The usage of Process metrics is reasonable for filters in Business rules - it is possible to deactivate or activate the bussiness rule by filtering out the whole data set.

Also specify the value(s) or custom expression for it:

:::image type="content" alt-text="media/image017-v52.png" source="media/image017-v52.png":::




