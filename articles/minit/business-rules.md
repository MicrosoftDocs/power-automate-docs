---
title: Business rules overview (preview)
description: Learn how to define business rules that evaluate KPIs in the Minit desktop application for Microsoft Power Automate process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Business rules overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Minit allows you to define business rules that evaluate your key performance indicators (KPI). Business rules set thresholds that are associated with a category flag&mdash;**Error**, **Warning**, or **OK**&mdash;to help you quickly spot problems in your processes.

Thresholds apply to all business rules in the process context. However, each business rule can have its own calculation formula and filters. Because business rules are part of the process context, they're available in any view you create for that process.

Results of business rules are displayed in the process map and the Statistics module.

## View, duplicate, or delete business rules

In the process context, select **Business rules** in the left side panel. The **Business rules** page lists all the business rules you've defined in the current context.

:::image type="content" source="media/br-define-list.png" alt-text="Screenshot of the Business rules page.":::

Use the hamburger menu at the right side of the list heading row to hide or show columns and customize your view.

:::image type="content" source="media/br-define-list-filters.png" alt-text="Screenshot of the business rules filters.":::

Use the (**...**) menu to duplicate or delete a business rule.

:::image type="content" source="media/br-define-list-context.png" alt-text="Screenshot of the business rule context menu.":::

## Define business rules

You can define business rules in the process context or the process map.

1. To start:

    - In the process context, select **CREATE NEW BUSINESS RULE**.
    - In the process map, open the **Customize** pane. In the **Business rules** section, select **Single business rule**, then select (**...**), and then select **Add**.

        :::image type="content" alt-text="Screenshot of the option to create a business rule in the Customize pane in the process map." source="media/brshortcut.png":::

1. Enter a name for the new rule.

1. Select the [calculation scope](business-rule-scope.md).

1. (Optional) Enter one or more tags to categorize the rule.

1. [Define business rule filters](#define-business-rule-filters).

1. [Define custom output](#define-custom-output).

1. [Define severities](#define-severities).

1. Select **Save**.

### Define business rule filters

Filters that you define in the business rule apply on top of any filters that you've applied to the process view. If no filters are defined in the business rule, the business rule data set is the same as the process view data set.

1. Select **FILTER**, and then select the **Add new filter** (**+**) icon.

    :::image type="content" source="media/br-define-filter-selection.png" alt-text="Screenshot of selecting filters in the business rule definition.":::

1. Select a case or event filter type.

1. Select values for the filter, and then select **Save**.

    :::image type="content" source="media/br-define-filter-attributes.png" alt-text="Screenshot of selecting filter attributes.":::

To exclude a filter from the business rule without deleting it, turn off **Enabled**. To delete a filter, select the **X** icon. To delete all the filters in the business rule, select the **Delete all filters** icon.

:::image type="content" source="media/br-define-filter-enable.png" alt-text="Screenshot of a defined filter in a business rule definition.":::

Use the **Import/export filters** icon to save the filters to a file or to import saved filters into another business rule.

Indicators at the bottom of the business rule panel show you at a glance how much of the view data set the business rule will cover. Hover over an indicator to view the number of cases or events that will be covered out of the total number of cases or events.

:::image type="content" source="media/br-define-coverage.png" alt-text="Screenshot of business rule coverage indicators.":::

### Define custom output

All business rule scopes, other than the process scope, have one default output. It's the count of cases, events, or edges that are in the business rule data set. You can also define a custom result formula output using [custom metrics](custom-metrics.md).

:::image type="content" alt-text="Screenshot of a custom result formula output." source="media/brdefinition1.png":::

For all custom formulas in the business rule, you can specify a [calculation context](calculation-context.md).

### Define severities

Define severities, or thresholds and limits, to score the results of the business rule outputs and assign a performance category flag. Three categories are available: Error, Warning, and OK. If the business rule output doesn't fit into one of these categories, the assigned category is Undefined, represented by a gray icon with a question mark.

:::image type="content" alt-text="Screenshot of severities." source="media/brdefinition2.png":::

Thresholds and limits can include both constant values and custom expressions that are dynamically calculated. For example, you might assign an Error flag when the duration of a case is longer than the average case duration.

You must define severities before you can save the business rule. The simplest definition of a severity category is the expression **Any**.

:::image type="content" alt-text="Screenshot of a severity operator description." source="media/brseverities.png":::

If the business rule doesn't have a custom output defined, severities are applied over the default output, count.

### See also

[Process context (preview)](process-context.md)  
[Business rules for process maps (preview)](business-rules-process-map.md)  
[Business rules statistics (preview)](business-rules-statistics.md)  
[Custom metrics overview (preview)](custom-metrics.md)
