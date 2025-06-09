---
title: Business rules for process maps
description: Learn how to display business rules in the process map in Power Automate Process Mining.
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik

ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Business rules for process maps

 To select business rules to view in the process map, select the **Customize** icon on the panel on the right in the **Process map** screen. You can display results per single business rule, or by severity over all business rules. Process scope business rules aren't available in the process map.

## Single business rule display

If you select **Single business rule**, results are displayed for the business rule you select in the events and edges lists. You can select different business rules for events and edges.

:::image type="content" alt-text="Screenshot of the Customize screen in the single business rule mode." source="media/br-customize-2.png":::

Legend:

1. Business rule views icon.
1. **Metric at node:** Event scope and case scope business rules.
1. **Metric at edge:** Edge scope and case scope business rules.
1. Value switch icon and business rule actions (**...**).

Because case scope business rules represent complete cases, you can select case scope business rules from both the events and edges lists. Event scope and edge scope business rules are available only in the corresponding list.

To switch between the default output&mdash;count&mdash;and a custom formula result, select the value switch icon to the right of the business rule list. Hover over the icon to show which value is being displayed in the process map. You can show any combination of default and custom output values for the business rules you selected.

## Severity display

If you select a severity, the process map displays the total number of occurrences of each element with that severity. That is, it shows the total number of cases, activities, and edges that are in the data sets for each business rule that resulted in the selected severity.

:::image type="content" alt-text="Screenshot of a process map displaying severity." source="media/brpmseverity.png":::

## Details display

Select an activity in the process map to view its details. In the **Business rules** section of the **Details** panel, you can select one or more business rules to display for the activity. The detailed view shows both default and custom results.

:::image type="content" alt-text="Screenshot of a process map details display mode." source="media/brpmdetails.png":::

## Related information

[Business rules overview](business-rules.md)
