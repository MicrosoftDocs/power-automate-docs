---
title: Business rule scope (preview)
description: Learn about the mandatory field Scope in business rule definition in the Minit desktop application for Microsoft Power Automate process advisor.
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

# Business rule scope (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You must select a **Scope** when you define a business rule. It determines the scope to which the output result is delivered.

## Process scope

Process scope is the most generic. It provides a single result per business rule data set.

For a process scope, define the custom result formula with an explicit calculation context to determine over which data elements the formula is calculated&mdash;events, edges, or cases. The default business rule result&mdash;count of elements&mdash;isn't available.

The calculation result isn't relevant to activities and edges. It's displayed only in the Statistics module.

An example of process scope is average case or event duration. When it's longer than two days, the value is assigned the category flag **Error**.

## Case scope

Case scope is similar to process scope, in that it provides a single result per business rule data set. The data element over which the formula is calculated is cases. The default output is the number of cases that fit into the business rule data set.

The calculation result is displayed in both the Statistics module and the process map. The process map highlights all activities and edges that belong to any of the cases in the business rule.

An example of case scope is cases without an approval process, as shown in the following screenshot:

:::image type="content" alt-text="Screenshot of cases without an approval process in the process map." source="media/brcasescopepm.png":::

## Event scope

Event scope provides results per activity. The data element over which the formula is calculated is events. The default output is the number of events that fit into the business rule data set.

The calculation result is displayed in the Statistics module and in the process map.

An example of event scope is average duration per activity.

:::image type="content" alt-text="Screenshot of the average duration per activity." source="media/image-62.png":::

In the detail view for a business rule, the results are displayed per activity. Each activity is categorized according to the defined severities.

:::image type="content" alt-text="Screenshot of a detail view for a single business rule." source="media/image-63.png":::

In the process map, the results are displayed per activity, in the same way as in the detailed view for a single business rule in Statistics.

:::image type="content" alt-text="Screenshot of the process map result per activity." source="media/breventscopepm.png":::

## Edge scope

Edge scope is the same as event scope, except that results are provided per edge. The calculation result is displayed in the Statistics module and the process map.
