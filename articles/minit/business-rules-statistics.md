---
title: Business rules statistics (preview)
description: Learn about the statistics available for business rules in the Minit desktop application for Microsoft Power Automate process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/28/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Business rules statistics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Along with statistics about your cases, activities, and edges, Minit collects statistics on each of your business rules. You can view them in the Statistics module.

In Statistics, select **Business rules** in the list at the top of the page. You can also select a scope. By default, the display includes all scopes.

:::image type="content" source="media/br-stats-list.png" alt-text="Screenshot of business rules selected in the Statistics module.":::

Statistics are available at two levels:

- **Summary view**: Displays a row of metrics for each business rule of the selected scope

- **Detailed view**: Displays metrics per activity or edge for a single business rule

## Summary view

The summary view displays a single row of metrics for each business rule you defined for the process or for business rules of the selected scope. The category isn't evaluated for event and edge business rules when you display them in the summary view. To display metrics per activity or edge, use the [**detailed view**](#detailed-view).

:::image type="content" alt-text="Screenshot of the summary view with all business rules selected." source="media/image-64.png":::

If you select a scope other than **All**, the list of business rules is limited to rules of the selected scope.

:::image type="content" alt-text="Screenshot of the summary view with case scope business rules selected." source="media/image-65.png":::

## Detailed view

Event scope and edge scope business rules calculate results per event or edge. To display the details of events or edges, select the scope and then select a business rule of that scope.

1. In the **scope** list, select either **Event** or **Edge**.
1. Select the filter icon to the right of the scope.
1. Select **All** and then select a business rule from the list.

    :::image type="content" source="media/br-stats-detail.png" alt-text="Screenshot of a single business rule selected for detailed display.":::

The table shows metrics for each activity or edge in the data set of the selected business rule.

:::image type="content" alt-text="Screenshot of the detailed view of business rule statistics." source="media/image-66.png":::

### See also

[Statistics overview (preview)](statistics.md)  
[Business rule scope (preview)](business-rule-scope.md)
