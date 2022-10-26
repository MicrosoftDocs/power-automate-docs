---
title: Business rules statistics (preview)
description: Learn how to use the business rules summary and detailed views in Minit desktop application in process advisor.
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

# Business rules statistics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Within the Statistics view, a new **Business rules** panel was added to display business rule results in the form of a table. As in Process Map, the main display modes are:

- **Summary view:** Displays a list of business rules for a given scope or for all.

- **Detailed view:** Displays results of a single business rule per scope element&mdash;activity or edge.

## Summary view

In the summary view, it's possible to display all business rules or select a specific business rule scope to limit the list of displayed business rules. The summary view displays a single result per view for each business rule. For process and case scoped business rules, it's a standard evaluation. For event and edge scoped business rules, it's an alternative evaluation to calculate results per all events/edges. As explained in the [Business rules scope](business-rule-scope.md) article, category isn't evaluated for event and edge business rules when displayed in the summary view. If you want to display detailed results per activity or edge, go to the following **Detailed view** section.

:::image type="content" alt-text="Screenshot of the summary view with all business rules selected." source="media/image-64.png":::

When selecting a scope other than **All**, the list of business rules will be limited to the rules of the given scope.

:::image type="content" alt-text="Screenshot of the summary view with a scope other than all business rules selected." source="media/image-65.png":::

## Detailed view

For the event and edge scope, proper business rule results are calculated per event/edge. To display results per event/edge, you need to select the summary mode of event/edge and then select a single business rule. As a result, a list of events/edges is displayed with business rule statistics per each element.

:::image type="content" alt-text="Screenshot of the detailed view." source="media/image-66.png":::


