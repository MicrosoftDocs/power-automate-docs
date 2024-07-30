---
title: Business rules overview
description: Learn how to define business rules that evaluate KPIs in Power Automate Process Mining.
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 07/18/2023
ms.author: janpidych
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Business rules overview

The Power Automate Process Mining desktop app allows you to define business rules that evaluate your key performance indicators (KPI). Business rules set thresholds that are associated with a category flag&mdash;**Error**, **Warning**, or **OK**&mdash;to help you quickly spot problems in your processes.

Thresholds apply to all business rules in the process context. However, each business rule can have its own calculation formula and filters. Because business rules are part of the process context, they're available in any view you create for that process.

## View, duplicate, or delete business rules

You can view, duplicate, or delete business rules in the **Process content** screen.

1. On the upper-right in the top menu, select [Process context](process-context.md).

1. On the panel to the left, select **Business rules**.

    The **Business rules** screen lists all the business rules you've defined in the current context.

1. To delete or duplicate a business rule, select the ellipses (**...**) in the last column of the business rule row, and then select either **Delete** or **Create duplicate**.

## Define business rules

You can define business rules in the  **Process content** screen.

1. On the upper-right in the top menu, select [Process context](process-context.md).

1. On the panel to the left, select **Business rules**.

1. Select **Create new business rule**.

1. In the **Rule name** field, enter a name for the business rule.

1. In the **Scope** field, select the [calculation scope](business-rule-scope.md) in the dropdown menu.

1. Add a filter:

    1.  Select **Add filter**, and then select the desired case or event.

    1. On the **Attributes** screen, complete the field and select **Save**.

    To learn more, go to [Define filters detail](#define-filters-detail) in this article.

1. Define custom output:

    1. Select the **Output** tab.

    1. Select **Number of cases** or **Custom result formula**.

    1. In the **Custom result formula** field, enter your formula and select **Save**.

    To learn more, go to [Define custom output detail](#define-custom-output-detail) in this article.

1. Add a severity:

    1. Select the **Severities** tab.

    1. Select **Add new severity** and select a type of severity from the dropdown menu.

    1. Select an expression from the dropdown menu, enter a value, and select **Save**.

    To learn more, go to [Define severities detail](#define-severities-detail) in this article.

1. Select **Save**.

### Define filters detail

Filters that you define in the business rule apply on top of any filters that you've applied to the process view. If no filters are defined in the business rule, the business rule data set is the same as the process view data set.

#### Additional options 

- To exclude a filter from the business rule without deleting it, turn off **Enabled**.

- To delete all the filters in the business rule, select  **Remove all filters**.

- To save the filters to a file, or to import saved filters into another business rule, select the ellipses (**...**) and select **Export Filter** or **Import Filter**.

Indicators at the bottom of the business rule panel show you at a glance how much of the view data set the business rule will cover. Hover over an indicator to view the number of cases or events that will be covered out of the total number of cases or events.

:::image type="content" source="media/br-define-coverage.png" alt-text="Screenshot of business rule coverage indicators.":::

### Define custom output detail

All business rule scopes, other than the process scope, have one default output. It's the count of cases, events, or edges that are in the business rule data set. You can also define a custom result formula output using [custom metrics](custom-metrics.md).

For all custom formulas in the business rule, you can specify a [calculation context](calculation-context.md).

### Define severities detail

Define severities, or thresholds and limits, to score the results of the business rule outputs and assign a performance category flag. Three categories are available: **Error**, **Warning**, and **OK**.

Thresholds and limits can include both constant values and custom expressions that are dynamically calculated. For example, you might assign an **Error** flag when the duration of a case is longer than the average case duration.

You must define severities before you can save the business rule. The simplest definition of a severity category is the expression **Any**.

If the business rule doesn't have a custom output defined, severities are applied over the default output, count.

## Related information

[Process context](process-context.md)  
[Business rules for process maps](business-rules-process-map.md)  
[Business rules statistics](business-rules-statistics.md)  
[Custom metrics overview](custom-metrics.md)
