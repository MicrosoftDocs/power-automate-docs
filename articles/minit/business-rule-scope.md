---
title: Business rule scope 
description: Learn about the mandatory field scope in business rule definition in Power Automate Process Mining.
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 06/10/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Business rule scope

Select a **Scope** when you define a business rule. It determines the scope to which the output result is delivered.

## Event scope

Event scope provides results per activity. The data element over which the formula is calculated is events. The default output is the number of events that fit into the business rule data set.

The calculation result displays in the **Statistics** and **Process map** screens. In the detail view for a business rule, the results display per activity. Each activity is categorized according to the defined severities. In the process map, the results display per activity, in the same way as in the detailed view for a single business rule in Statistics.

## Edge scope

Edge scope is the same as event scope, except that results are provided per edge. The calculation result displays in the **Statistics** and **Process map** screens.

## Case scope

Case scope provides the result for each case in the business rule data set. The data element over which the formula is calculated is cases. The default output is 1 (True) if the case fits into the business rule data set.

The calculation result displays in the **Statistics** screen.

## Process scope

Process scope is the most generic. It provides a single result per business rule data set.

For a process scope, define the custom result formula with an explicit calculation context to determine over which data elements the formula is calculated&mdash;events, edges, or cases. The default business rule result&mdash;count of elements&mdash;isn't available.

The calculation result isn't relevant to activities and edges. It displays in the **Statistics** screen only.

An example of process scope is average case or event duration. When it's longer than two days, the value is assigned the category flag **Error**.

## Related information

[Business rules overview](business-rules.md)
