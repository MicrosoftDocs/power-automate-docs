---
title: Business rules overview (preview)
description: Learn how to define and evaluate KPIs in Minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Business rules overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The **Business rules** module allows you to define and evaluate KPIs based on given thresholds and limits. Each defined threshold contains also a category flag&mdash;**Error**, **Warning**, or **OK**&mdash;for a quick visualization of the resulted value. Except for thresholds definitions, each business rule can have its own calculation formula and/or set of its own filters, which are applied over the data set in the actual view. Business rules are defined in the process context of the current process, therefore are available in any view for the given process. In application, business rules are displayed in Process Map and Statistics.

Definition of a business rule can be done in the **Process context** window available within the **Project hub**, using the Process context menu.

The **Business rules** panel provides the list of custom metrics and their properties defined in the context of this process. If there's no business rule defined yet, you're encouraged to create one by selecting **Create New Business Rule**. Context menu for each business rule allows you to delete the item or create a duplicate of that metric, then modify and save it with a different name.

:::image type="content" alt-text="Screenshot of the Business rule screen in the Process context module." source="media/image-61.png":::

Another option is to use context menu in the **Customize** panel directly in the process map. To access the window, select (**...**) under the **Business rules** tab.

:::image type="content" alt-text="Screenshot of the option to create a business rule in the Customize screen in the process map." source="media/brshortcut.png":::

## Business rule screen

The **Business rule** panel is divided into two parts. The top half contains the rule header fields. The middle part consists of three tabs defining the rule filters, custom output (custom formula) and severities (thresholds & limits).

:::image type="content" alt-text="Screenshot of the parts of the Business rule screen." source="media/brdefinition0.png":::

### Business rule header

Write your formula into the **Metric formula:** field. The editor offers full syntax editing features, including:

- Name - name of the business rule to be displayed within the Minit application

- Scope - rule calculation scope with 4 options: Process, Case, Event, and Edge. For more details, see **[Business ](business-rule-scope.md)[r](business-rule-scope.md)[ule scopes](business-rule-scope.md)**.

- Tags - to mark/group rules - just write a tag (any text you like) and press ENTER to identify the end of tag

:::image type="content" alt-text="Screenshot of the business rule header." source="media/brheader.png":::

### Business rule filters

The first tab in the middle part of the panel is filter definition. If no filters are defined, the business rule data set is the same as the data set in the actual view. Any filters defined in the business rule definition are applied on top of all the filters in the actual view. It is possible to use any of the existing filter types with the exception of the Variants filter. To add the filter, use the 'plus' icon on the right side. Once filters are defined, the user can enable/disable it using the 'Enabled' slider in the filter list.

:::image type="content" alt-text="Screenshot of the business rule filters." source="media/br-filters.png":::

Next to the 'plus' icon is a quick filter icon, which copies all the existing filters withing the business rule into the actual view, so the user can easily create/update the view to match the data according to the business rule data set.

In the bottom of the business rule panel, the user can find four coverage indicators. First two indicate case and event coverage of the business rule data set versus all process data. The second pair of indicators shows case and event coverage of the business rule data set versus actual view data.

### Output - Custom formula

For all the business rule scopes, apart from the Process scope, there's always one default output. It's the count of cases, events or edges which fit into the business rule data set. It's possible to calculate your own output&mdash;custom formula (defined as [custom metric](custom-metrics.md)). Compared to custom metrics, this output - custom formula isn't limited and provides the full power of the custom metric capabilities.

:::image type="content" alt-text="Screenshot of custom result formula output." source="media/brdefinition1.png":::

For all custom formulas within the business rule, there is option to use business rule specific calculation context - see [Calculation context](calculation-context.md) for more details.

### Severities: Thresholds and limits

Severities are after definition of business rule data set and output formula the last part of business rule definition. The purpose of the Severities section is to score results of the business rule outputs and assign a performance indicator to these result values. Three categories of indicators are available: Error, Warning, OK. If the business rule output doesn't fit into any of the defined severity, the assigned category is Undefined (represented by a grey icon with a question mark; this category is not available to the user).

:::image type="content" alt-text="Screenshot of severities." source="media/brdefinition2.png":::

Thresholds and limits defined for severities are not limited to constant values, but can be defined as custom expressions, to dynamically calculate values from the actual data set. For example, raise Error when duration of a case is two times longer, or longer than average case duration.

Definition of the business rule severities is mandatory. The most simple definition is using operator **Any** and selecting the desired category. For example, the existence of any delayed order means red flag regardless of how much finance in total is in such orders.

:::image type="content" alt-text="Screenshot of a severity operator description." source="media/brseverities.png":::

If the business rule doesn't have a defined custom output (custom formula), severities are applied over a default output (count).

## Application in Minit

Business rules are displayed in [Process](business-rules-process-map.md) map and in [Statistics](business-rules-statistics.md).
