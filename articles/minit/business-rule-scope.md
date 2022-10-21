---
title: Business rule scope (preview)
description: Learn about the business rule scope mandatory field for business rule definition in the Minit desktop application in process advisor.
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

# Business rule scope (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Business rule scope is a mandatory field for business rule definition. It determines the scope to which the output result is delivered. On the contrary, where custom metric context determines the input data set used for metric calculations, here the business rule scope determines the output scope.

## Process scope

Process scope is the most generic scope for the calculation, which provides a single result per business rule data set. This result is not relevant related to Process Map elements (activities or edges) and thus it is displayed only in Statistics. In Statistics, there is a single row (evaluation) per business rule data set. Example of such a business rule scope is average case or event duration – when longer than two days, it means red flag (Error).

For the Process scope, you need to define the output custom formula with explicit calculation context to determine over which data elements the formula is calculated&mdash;events, edges, or cases. The default business rule result&mdash;count of elements&mdash;isn't available.

:::image type="content" alt-text="media/screenshot of the process scope business rule screen." source="media/brprocessscope.png":::

## Case scope

Case scope is similar to the Process scope. Again, it provides a single result per business rule data set. Calculation data element is set to cases. Default output is thus a number of cases that fit into business rule data set.

Business rule is applicable in both Statistics and Process Map. In Statistics, there is a single row (evaluation) per business rule data set. Case scope business rule is applicable also in Process Map, where it highlights all activities and edges that belong to any of the cases withing the given business rule.

:::image type="content" alt-text="Screenshot of the case scope business rule screen." source="media/brcasescope.png":::

Example: Cases without approval process displayed in the process map.

:::image type="content" alt-text="Screenshot of cases without an approval process in the process map." source="media/brcasescopepm.png":::

## Event scope

The event scope provides results per activity within the data set. The calculation data element is set to event. The default output is thus a number of events that fit into business rule data set.

:::image type="content" alt-text="Screenshot of the event scope business rule screen." source="media/breventscope-1.png":::

Example: Average duration per activity.

In Statistics, the business rule is displayed in summary lists of all or event scope business rules. In these views are calculated single values per all events in business rule data set. For such global evaluation, it isn't a calculated category due to misleading results when the global average may fit into the limit, but some activities are outside the safe range.

:::image type="content" alt-text="Screenshot of the average duration per activity." source="media/image-62.png":::

In the detailed view for a single business rule, the results are displayed per activity, and each activity is categorized according to the defined severities.

:::image type="content" alt-text="Screenshot of a detailed view for a single business rule." source="media/image-63.png":::

In Process Map, the results are displayed per activity, in the same way as in the detailed view for a single business rule in Statistics.

:::image type="content" alt-text="Screenshot of the process map result per activity." source="media/breventscopepm.png":::

## Edge scope

The same as for the Event scope, but instead of the output result per activity, here are results per edge. Applicable in Statistics and Process Map in the same way as the Event scope.
