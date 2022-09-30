---
title: Business Rule Scope
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

# Business Rule Scope

Business rule scope is a mandatory field for business rule definition. It determines the scope to which is the output result delivered. On the contrary, custom metric context determines the input data set used for metric calculations, here the business rule scope determines the output scope.

:::image type="content" alt-text="media/brheader-1.png" source="media/brheader-1.png":::

## Process scope

Process scope is the most generic scope for the calculation which provides a single result per business rule data set. This result is not relevant related to Process Map elements (activities or edges) and thus it is displayed only in Statistics. In Statistics, there is a single row (evaluation) per business rule data set. Example of such a business rule scope is average case or event duration – when longer than two days, it means red flag (Error).

For the Process scope, the user needs to define the output custom formula with explicit calculation context to determine over which data elements the formula is calculated - events, edges, or cases. The default business rule result - count of elements - is not available.

:::image type="content" alt-text="media/brprocessscope.png" source="media/brprocessscope.png":::

## Case scope

Case scope is similar to the Process scope. Again, it provides a single result per business rule data set. Calculation data element is set to cases. Default output is thus a number of cases which fit into business rule data set.

Business rule is applicable in both Statistics and Process Map. In Statistics, there is a single row (evaluation) per business rule data set. Case scope business rule is applicable also in Process Map, where it highlights all activities and edges which belong to any of the cases withing the given business rule.

:::image type="content" alt-text="media/brcasescope.png" source="media/brcasescope.png":::

Example: Cases without approval process displayed in Process Map.

:::image type="content" alt-text="media/brcasescopepm.png" source="media/brcasescopepm.png":::

## Event scope

The event scope provides results per activity within the data set. The calculation data element is set to event. The default output is thus a number of events which fit into business rule data set.

:::image type="content" alt-text="media/breventscope-1.png" source="media/breventscope-1.png":::

Example: Average duration per activity.
In Statistics, the business rule is displayed in summary lists of all or event scope business rules. In these views is calculated single value per all events in business rule data set. For such global evaluation, it is not a calculated category (due to misleading results when the global average may fit into the limit, but some activities are outside the safe range).

:::image type="content" alt-text="media/image-62.png" source="media/image-62.png":::

In the detailed view for a single business rule, the results are displayed per activity, and each activity is categorized according to the defined severities.

:::image type="content" alt-text="media/image-63.png" source="media/image-63.png":::

In Process Map, the results are displayed per activity, in the same way as in the detailed view for a single business rule in Statistics.

:::image type="content" alt-text="media/breventscopepm.png" source="media/breventscopepm.png":::

## Edge scope

The same as for the Event scope, but instead of the output result per activity, here are results per edge. Applicable in Statistics and Process Map in the same way as the Event scope.


